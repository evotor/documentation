---
title: О манифесте приложения
keywords: манифест, manifest
summary:
sidebar: evotordoc_sidebar
permalink: doc_about_manifest.html
tags: [terminal, Java, JavaScript]
folder: smart_terminal_app_development
---

В структуре каждого приложения должен быть манифест AndroidManifest.xml.

В манифесте необходимо объявить все компоненты, которые использует приложение:

* Для [java-приложения](./doc_java_app_manifest.html) – операции, службы и приёмники.
* Для [js-приложения](./doc_js_app_manifest.html) – демоны, плагины и экраны (view.html).

Соответствующие изменения в файле манифеста необходимы для взаимодействия приложения и смарт-терминала с помощью [точек интеграции](./doc_app_integration_points.html).

Подробнее о том, что такое [манифест приложения](https://developer.android.com/guide/topics/manifest/manifest-intro.html?hl=ru).
