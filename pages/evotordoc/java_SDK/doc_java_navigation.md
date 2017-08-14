---
title: Вызов окон смарт-терминала
keywords:
summary: Раздел содержит инструкцию по переходу к элементам управления смарт-терминалом.
sidebar: evotordoc_sidebar
permalink: doc_java_navigation.html
tags: [Терминал, Java,]
folder: java_SDK
---

Для вызова окон смарт-терминала используйте класс `NavigationApi`.

Ваше приложение может вызывать окна смарт-терминала:

* окно редактирования клише чека (**Настройки** > **Кассовый чек**);

   ![](images\receiptsettings.png)

* окно доступа к отчётам (**Отчёты** > **Кассовый чек**).

   ![](images\CashRegisterReport.png)

*Чтобы вызывать окна смарт-терминала:*

   в коде кнопки, по нажатию которой вы хотите вызвать окно, добавьте один из следующих элементов:

   * Если вы хотите вызвать окно настройки клише чека добавьте:

      ```java
      startActivity(NavigationApi.createIntentForCashReceiptSettings());
      ```
   * Если вы хотите вызвать окно доступа к отчётам:

      ```java
      startActivity(NavigationApi.createIntentForCashRegisterReport());
      ```
