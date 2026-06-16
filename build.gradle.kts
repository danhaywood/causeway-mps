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
dependencies {
    mps("com.jetbrains:mps:2025.3")
}

val mpsHomeDir = layout.buildDirectory.dir("mps")

val resolveMps by tasks.registering(Sync::class) {
    from({ mps.map { zipTree(it) } })
    into(mpsHomeDir)
}

tasks.register<MpsCheck>("checkModels") {
    dependsOn(resolveMps)
    mpsHome.set(mpsHomeDir)
    projectLocation.set(layout.projectDirectory)
}

tasks.register<MpsGenerate>("generateModels") {
    dependsOn(resolveMps)
    mpsHome.set(mpsHomeDir)
    projectLocation.set(layout.projectDirectory)
}
