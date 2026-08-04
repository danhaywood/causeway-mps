// Minimal headless MPS build for the spike (spike-headless-authoring).
// Uses de.itemis.mps.gradle.common's MpsCheck/MpsGenerate task types to run
// modelcheck + generate directly over this MPS project — a validation oracle
// for hand-authored .mps models. Toolchain: docs/headless-build-research.md.
// Requires Gradle 9.x. Plugin + MPS distribution resolved from the itemis repo.

import de.itemis.mps.gradle.BuildLanguages
import de.itemis.mps.gradle.tasks.MpsCheck
import de.itemis.mps.gradle.tasks.MpsGenerate
import org.gradle.api.tasks.compile.JavaCompile
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
dependencies {
    mps("com.jetbrains:mps:$pinnedMpsVersion")

    stubs("org.apache.causeway.core:causeway-applib:3.6.0")
    stubs("jakarta.persistence:jakarta.persistence-api:3.1.0")
    stubs("jakarta.inject:jakarta.inject-api:2.0.1")
}

val mpsHomeDir = layout.buildDirectory.dir("mps")

val resolveMps by tasks.registering(Sync::class) {
    from({ mps.map { zipTree(it) } })
    into(mpsHomeDir)
}

// Stage the stub jars at the static path the causeway.stubs .msd references (${module}/libs).
// libs/ is git-ignored; this task repopulates it from the resolved dependencies.
val resolveStubs by tasks.registering(Sync::class) {
    from(stubs)
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

val compileGeneratedJava by tasks.registering(JavaCompile::class) {
    dependsOn(checkModels)
    description = "Compiles Java generated from the Causeway sandbox models."
    source(layout.projectDirectory.dir("languages/causeway.sandbox/source_gen"))
    classpath = stubs
    destinationDirectory.set(layout.buildDirectory.dir("classes/generated-sandbox"))
    options.release.set(generatedJavaVersion)
    options.encoding = "UTF-8"
}

tasks.register("headlessBuild") {
    group = "build"
    description = "Generates models, checks them, then compiles generated Java."
    dependsOn(compileGeneratedJava)
}
