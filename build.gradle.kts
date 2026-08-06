// Minimal headless MPS build for the spike (spike-headless-authoring).
// Uses de.itemis.mps.gradle.common's MpsCheck/MpsGenerate task types to run
// modelcheck + generate directly over this MPS project — a validation oracle
// for hand-authored .mps models. Toolchain: docs/headless-build-research.md.
// Requires Gradle 9.x. Plugin + MPS distribution resolved from the itemis repo.

import de.itemis.mps.gradle.BuildLanguages
import de.itemis.mps.gradle.tasks.MpsCheck
import de.itemis.mps.gradle.tasks.MpsGenerate
import org.gradle.api.GradleException
import org.gradle.api.tasks.compile.JavaCompile
import org.gradle.jvm.tasks.Jar
import org.gradle.jvm.toolchain.JavaLanguageVersion

plugins {
    java
    id("de.itemis.mps.gradle.common") version "1.30.1.1.bc0f59d"
}

val pinnedMpsVersion = providers.gradleProperty("mpsVersion").get()
val mpsRuntimeJavaVersion = providers.gradleProperty("mpsRuntimeJavaVersion").get().toInt()
val generatedJavaVersion = providers.gradleProperty("generatedJavaVersion").get().toInt()

java {
    toolchain {
        languageVersion.set(JavaLanguageVersion.of(generatedJavaVersion))
    }
}

val mpsRuntimeJava = javaToolchains.launcherFor {
    languageVersion.set(JavaLanguageVersion.of(mpsRuntimeJavaVersion))
}

repositories {
    maven("https://artifacts.itemis.cloud/repository/maven-mps/")
    mavenCentral()
}

// The MPS distribution the build runs against.
// Keep this aligned with the authoring IDE baseline; MPS 2026.1 requires JDK 21.
val mps: Configuration by configurations.creating
// Causeway/Jakarta jars imported into the shared `causeway.stubs` solution as MPS `java_classes` stubs
// (so generator templates AND DSL programs can resolve @DomainObject, @Entity, SemanticsOf, …).
// Versions mirror reference-app/pom.xml.
// Transitive: a Causeway annotation like @DomainObject is itself meta-annotated with Spring
// (@Component/@Scope) etc., so the stub class is only valid if those resolve too — we need the
// full compile closure (Spring/Jackson/…), mirroring reference-app's classpath.
val stubs: Configuration by configurations.creating { isTransitive = true }
// Runtime-only verification support for generated mixins; this does not leak into generated
// application compilation or the MPS stub solution.
val mixinVerificationDependencies: Configuration by configurations.creating { isTransitive = true }
dependencies {
    mps("com.jetbrains:mps:$pinnedMpsVersion")

    stubs("org.apache.causeway.core:causeway-applib:3.6.0")
    stubs("jakarta.persistence:jakarta.persistence-api:3.1.0")
    stubs("jakarta.inject:jakarta.inject-api:2.0.1")

    mixinVerificationDependencies("org.apache.causeway.core:causeway-core-metamodel:3.6.0")
}

val mixinVerificationSourceSet = sourceSets.create("mixinVerification") {
    java.srcDir("verification/src/main/java")
    compileClasspath += mixinVerificationDependencies
    runtimeClasspath += output + compileClasspath
}

val mpsHomeDir = layout.buildDirectory.dir("mps")
val mpsVersionMarker = mpsHomeDir.map { it.file(".resolved-version") }

val resolveMps by tasks.registering(Sync::class) {
    from({ mps.map { zipTree(it) } })
    into(mpsHomeDir)
    onlyIf("the cached MPS distribution does not match the pinned version") {
        val marker = mpsVersionMarker.get().asFile
        !marker.isFile || marker.readText().trim() != pinnedMpsVersion
    }
    doLast {
        mpsVersionMarker.get().asFile.writeText("$pinnedMpsVersion\n")
    }
}

// Compile the complete golden reference app once, then publish separate artifacts for MPS signature
// resolution and generated-Java compilation.
val compileReferenceApp by tasks.registering(JavaCompile::class) {
    description = "Compiles the golden reference app used to build application-support stubs."
    source(layout.projectDirectory.dir("reference-app/src/main/java"))
    classpath = stubs
    destinationDirectory.set(layout.buildDirectory.dir("classes/reference-app"))
    javaCompiler.set(javaToolchains.compilerFor {
        languageVersion.set(JavaLanguageVersion.of(generatedJavaVersion))
    })
    options.release.set(generatedJavaVersion)
    options.encoding = "UTF-8"
}

val referenceAppStubs by tasks.registering(Jar::class) {
    dependsOn(compileReferenceApp)
    description = "Packages exact reference-app signatures for the MPS Java class-stub model root."
    archiveFileName.set("reference-app-stubs.jar")
    destinationDirectory.set(layout.buildDirectory.dir("libs/application-stubs"))
    from(compileReferenceApp.flatMap { it.destinationDirectory })
}

val referenceAppSupport by tasks.registering(Jar::class) {
    dependsOn(compileReferenceApp)
    description = "Packages hand-written reference-app support without golden entity classifiers."
    archiveFileName.set("reference-app-support.jar")
    destinationDirectory.set(layout.buildDirectory.dir("libs/application-support"))
    from(compileReferenceApp.flatMap { it.destinationDirectory }) {
        include("app/**")
    }
}

// Stage the dependency and exact MPS-signature jars at the static path the causeway.stubs .msd
// references (${module}/libs). libs/ is git-ignored and reproduced on every build.
val resolveStubs by tasks.registering(Sync::class) {
    dependsOn(referenceAppStubs)
    from(stubs)
    from(referenceAppStubs.flatMap { it.archiveFile })
    into(layout.projectDirectory.dir("languages/causeway.stubs/libs"))
}

// MpsGenerate compiles language aspect models from a clean checkout, but it does not emit the
// Language/Generator deployment descriptors needed by the next headless MPS process.
// MPS 2026.1's Ant Make worker is compiled for JDK 25; generated application Java remains on 21.
val bootstrapLanguage by tasks.registering(BuildLanguages::class) {
    dependsOn(resolveMps, resolveStubs)
    description = "Makes the Causeway language and generator deployable from a clean checkout."
    script = layout.projectDirectory.file("gradle/mps-bootstrap.xml")
    targets("make-language")
    scriptArgs = listOf(
        "-Dmps.home=${mpsHomeDir.get().asFile.absolutePath}",
        "-Dproject.dir=${layout.projectDirectory.asFile.absolutePath}",
    )
    scriptClasspath = files(
        fileTree(mpsHomeDir.map { it.dir("lib") }) { include("*.jar") },
        fileTree(mpsHomeDir.map { it.dir("lib/ant/lib") }) { include("*.jar") },
    )
    executable(mpsRuntimeJava.get().executablePath.asFile.absolutePath)
}

val generateModels by tasks.registering(MpsGenerate::class) {
    dependsOn(bootstrapLanguage)
    mpsHome.set(mpsHomeDir)
    projectLocation.set(layout.projectDirectory)
}

val checkModels by tasks.registering(MpsCheck::class) {
    dependsOn(generateModels)
    mpsHome.set(mpsHomeDir)
    projectLocation.set(layout.projectDirectory)
}

val generatedCustomerSource = layout.projectDirectory.file(
    "languages/causeway.sandbox/source_gen/customers/Customer.java",
)
val generatedTopLevelProbeSource = layout.projectDirectory.file(
    "languages/causeway.sandbox/source_gen/customers/Customer_topLevelProbe.java",
)

val verifyGeneratedSourceStructure by tasks.registering {
    dependsOn(checkModels)
    group = "verification"
    description = "Verifies transparent invocation structure in generated Java sources."
    inputs.files(generatedCustomerSource, generatedTopLevelProbeSource)

    doLast {
        fun classBody(source: String, declaration: String): String {
            val declarationIndex = source.indexOf(declaration)
            if (declarationIndex < 0) {
                throw GradleException("Generated source is missing '$declaration'")
            }
            val openingBrace = source.indexOf('{', declarationIndex)
            var depth = 0
            for (index in openingBrace until source.length) {
                when (source[index]) {
                    '{' -> depth++
                    '}' -> {
                        depth--
                        if (depth == 0) {
                            return source.substring(openingBrace + 1, index)
                        }
                    }
                }
            }
            throw GradleException("Generated class '$declaration' has unbalanced braces")
        }

        fun requireContains(body: String, expected: String, owner: String) {
            if (!body.contains(expected)) {
                throw GradleException("Generated $owner is missing '$expected'")
            }
        }

        fun requireAbsent(body: String, forbidden: String, owner: String) {
            if (body.contains(forbidden)) {
                throw GradleException("Generated $owner unexpectedly contains '$forbidden'")
            }
        }

        val customerSource = generatedCustomerSource.asFile.readText()
        val topLevelProbeSource = generatedTopLevelProbeSource.asFile.readText()
        val reservedField = "private FactoryService __factoryService;"
        val nestedCaller = classBody(customerSource, "public static class invokePlaceOrder {")
        val topLevelCaller = classBody(customerSource, "public static class invokeTopLevelProbe {")
        val unchangedNestedAction = classBody(customerSource, "public static class placeOrder {")
        val unchangedTopLevelAction = classBody(topLevelProbeSource, "public class Customer_topLevelProbe {")

        requireContains(nestedCaller, reservedField, "invokePlaceOrder")
        requireContains(
            nestedCaller,
            "return __factoryService.mixin(placeOrder.class, mixee).act(product, quantity);",
            "invokePlaceOrder",
        )
        requireContains(topLevelCaller, reservedField, "invokeTopLevelProbe")
        requireContains(
            topLevelCaller,
            "return __factoryService.mixin(Customer_topLevelProbe.class, mixee).act();",
            "invokeTopLevelProbe",
        )
        requireAbsent(unchangedNestedAction, reservedField, "placeOrder")
        requireAbsent(unchangedTopLevelAction, reservedField, "Customer_topLevelProbe")

        val reservedFieldCount = Regex(Regex.escape(reservedField)).findAll(customerSource).count()
        if (reservedFieldCount != 2) {
            throw GradleException(
                "Expected exactly two generated FactoryService fields in Customer.java, found $reservedFieldCount",
            )
        }
    }
}

val compileGeneratedJava by tasks.registering(JavaCompile::class) {
    dependsOn(checkModels, verifyGeneratedSourceStructure)
    description = "Compiles Java generated from the Causeway sandbox models."
    source(layout.projectDirectory.dir("languages/causeway.sandbox/source_gen"))
    classpath = stubs + files(referenceAppSupport.flatMap { it.archiveFile })
    destinationDirectory.set(layout.buildDirectory.dir("classes/generated-sandbox"))
    options.release.set(generatedJavaVersion)
    options.encoding = "UTF-8"
}

val compileMixinVerificationJava = tasks.named<JavaCompile>(mixinVerificationSourceSet.compileJavaTaskName) {
    dependsOn(compileGeneratedJava)
    classpath = mixinVerificationDependencies + stubs + files(
        referenceAppSupport.flatMap { it.archiveFile },
        compileGeneratedJava.flatMap { it.destinationDirectory },
    )
    javaCompiler.set(javaToolchains.compilerFor {
        languageVersion.set(JavaLanguageVersion.of(generatedJavaVersion))
    })
    options.release.set(generatedJavaVersion)
    options.encoding = "UTF-8"
}

val verifyGeneratedMixins by tasks.registering(JavaExec::class) {
    dependsOn(compileMixinVerificationJava)
    group = "verification"
    description = "Verifies generated action classes with the Causeway programming model."
    mainClass.set("causeway.verification.GeneratedMixinRuntimeCheck")
    classpath = mixinVerificationSourceSet.output + mixinVerificationDependencies + stubs + files(
        referenceAppSupport.flatMap { it.archiveFile },
        compileGeneratedJava.flatMap { it.destinationDirectory },
    )
    javaLauncher.set(javaToolchains.launcherFor {
        languageVersion.set(JavaLanguageVersion.of(generatedJavaVersion))
    })
}

tasks.register("headlessBuild") {
    group = "build"
    description = "Generates models, checks and compiles them, then verifies generated Causeway mixins."
    dependsOn(verifyGeneratedMixins)
}
