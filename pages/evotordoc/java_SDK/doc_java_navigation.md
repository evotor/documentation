---
title: Вызов окон смарт-терминала
keywords: интерфейс, окно, методы, навигация
summary: Раздел содержит инструкцию по переходу к элементам управления смарт-терминалом.
sidebar: evotordoc_sidebar
permalink: doc_java_navigation.html
tags: [terminal, java]
folder: java_SDK
---

Для вызова окон смарт-терминала используйте класс [`NavigationApi`](https://github.com/evotor/integration-library/blob/master/app/src/main/java/ru/evotor/framework/navigation/NavigationApi.kt).

Ваше приложение может вызывать следующие окна смарт-терминала:

* окно редактирования клише чека (**Настройки** → **Кассовый чек**);

   {: .center-image}
   ![](images\receiptsettings.png)

* окно доступа к кассовым отчётам (**Отчёты** → **Кассовый отчёт**).

   {: .center-image}
   ![](images\CashRegisterReport.png)

## Вызов окон смарт-терминала

*Чтобы вызывать необходимое окно выполните код:*

   * Если вы хотите вызвать окно настройки клише выполните код:

```java
startActivity(NavigationApi.createIntentForCashReceiptSettings());
```
   * Если вы хотите вызвать окно доступа к кассовым отчётам выполните код:

```java
startActivity(NavigationApi.createIntentForCashRegisterReport());
```
