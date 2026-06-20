// Minimal headless MPS build for the spike (spike-headless-authoring).
// Uses de.itemis.mps.gradle.common's MpsCheck/MpsGenerate task types to run
// modelcheck + generate directly over this MPS project — a validation oracle
// for hand-authored .mps models. Toolchain: docs/headless-build-research.md.
// Requires Gradle 9.x. Plugin + MPS distribution resolved from the itemis repo.

import de.itemis.mps.gradle.tasks.MpsCheck
import de.itemis.mps.gradle.tasks.MpsGenerate

plugins {
    id("de.itemis.mps.gradle.common") version "1.30.1.1.bc0f59d"
}

repositories {
    maven("https://artifacts.itemis.cloud/repository/maven-mps/")
    mavenCentral()
}

// The MPS distribution the build runs against.
val mps: Configuration by configurations.creating
// Causeway/Jakarta jars imported into the shared `causeway.stubs` solution as MPS `java_classes` stubs
// (so generator templates AND DSL programs can resolve @DomainObject, @Entity, SemanticsOf, …).
// Versions mirror reference-app/pom.xml.
// isTransitive = false: only the direct API jars are needed to resolve the annotations we use.
val stubs: Configuration by configurations.creating { isTransitive = false }
dependencies {
    mps("com.jetbrains:mps:2025.3")

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

tasks.register<MpsCheck>("checkModels") {
    dependsOn(resolveMps, resolveStubs)
    mpsHome.set(mpsHomeDir)
    projectLocation.set(layout.projectDirectory)
}

tasks.register<MpsGenerate>("generateModels") {
    dependsOn(resolveMps, resolveStubs)
    mpsHome.set(mpsHomeDir)
    projectLocation.set(layout.projectDirectory)
}
