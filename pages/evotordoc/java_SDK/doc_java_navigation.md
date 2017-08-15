---
title: Вызов окон смарт-терминала
keywords:
summary: Раздел содержит инструкцию по переходу к элементам управления смарт-терминалом.
sidebar: evotordoc_sidebar
permalink: doc_java_navigation.html
tags: [Терминал, Java]
folder: java_SDK
---

Для вызова окон смарт-терминала используйте класс `NavigationApi`.

Ваше приложение может вызывать окна смарт-терминала:

* окно редактирования клише чека (**Настройки** > **Кассовый чек**);

   ![](images\receiptsettings.png)

* окно доступа к кассовым отчётам (**Отчёты** > **Кассовый отчёт**).

   ![](images\CashRegisterReport.png)

*Чтобы вызывать необходимое окно выполните код:*

   * Если вы хотите вызвать окно настройки клише выполните код:

```java
startActivity(NavigationApi.createIntentForCashReceiptSettings());
```
   * Если вы хотите вызвать окно доступа к кассовым отчётам выполните код:

```java
startActivity(NavigationApi.createIntentForCashRegisterReport());
```
