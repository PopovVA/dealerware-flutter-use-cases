import java.util.Properties

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.vadimpopov.dealerware_flutter_use_cases"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.vadimpopov.dealerware_flutter_use_cases"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val keystorePropertiesFile = rootProject.file("key.properties")
            val keystoreProperties = Properties()
            if (keystorePropertiesFile.exists()) {
                println("✅ Found keystore properties file: ${keystorePropertiesFile.absolutePath}")
                keystorePropertiesFile.inputStream().use { keystoreProperties.load(it) }
                if (keystoreProperties["storeFile"] == null) println("⚠️ Missing storeFile in key.properties")
                if (keystoreProperties["storePassword"] == null) println("⚠️ Missing storePassword in key.properties")
                if (keystoreProperties["keyAlias"] == null) println("⚠️ Missing keyAlias in key.properties")
                if (keystoreProperties["keyPassword"] == null) println("⚠️ Missing keyPassword in key.properties")
            } else {
                println("⚠️ Keystore properties file not found at: ${keystorePropertiesFile.absolutePath}")
            }

            storeFile = file(keystoreProperties["storeFile"] ?: "upload-keystore.jks")
            storePassword = keystoreProperties["storePassword"] as String?
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
