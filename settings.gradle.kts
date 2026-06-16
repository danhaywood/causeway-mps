pluginManagement {
    repositories {
        gradlePluginPortal()
        mavenCentral()
        // itemis hosts the plugin's build-backends (launcher) and the MPS distribution
        maven("https://artifacts.itemis.cloud/repository/maven-mps/")
    }
}

rootProject.name = "causeway-mps"
