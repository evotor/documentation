---
title: Зависимости проекта
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_dependencies.html
tags: [terminal, react]
folder: react_SDK
published: false
---

Чтобы вы могли корректно работать с нашей библиотекой вам потребуется настроить зависимости в проекте:

Вам потребуется Android Studio версии 3.0 и выше.

*Чтобы настроить зависимости в проекте:*

1. В Android Studio откройте папку `<ProjectName>\Android`.
2. В build.gradle проекта укажите:

   ```
      buildscript {
       repositories {
           jcenter()
           google()
       }
       dependencies {
           classpath 'com.android.tools.build:gradle:3.0.0'
       }
   }

   allprojects {
       repositories {
           mavenLocal()
           jcenter()
           maven {
               maven { url 'https://jitpack.io' }
               google()
           }
       }
   }
   ```

3. В файле settings.gradle укажите:

   ```
   rootProject.name = 'ProjectName'

   include ':app'
   include ':evotor-integration-library'
   project(':evotor-integration-library').projectDir = new File(rootProject.projectDir,    '../node_modules/evotor-integration-library/android/app')

   ```

4. В файле gradle.properties:

   ```
   android.useDeprecatedNdk=true
   org.gradle.jvmargs=-Xmx4608M
   android.enableAapt2=false
   MYAPP_RELEASE_STORE_FILE=my-release-key.keystore
   MYAPP_RELEASE_KEY_ALIAS=my-key-alias
   MYAPP_RELEASE_STORE_PASSWORD=qwerty
   MYAPP_RELEASE_KEY_PASSWORD=qwerty
   ```

5. В файле build.gradle приложения укажите:

   ```
   defaultConfig {
           applicationId "com.awesomeproject"
           minSdkVersion 22
           targetSdkVersion 22
           versionCode 1
           versionName "1.0"
           ndk {
               abiFilters "armeabi-v7a", "x86"
           }
       }
       dependencies {
           compile project(':evotor-integration-library')
           compile fileTree(dir: "libs", include: ["*.jar"])
           compile 'com.android.support:appcompat-v7:26.+'
           compile "com.facebook.react:react-native:+"  // From node_modules
       }
   ```
