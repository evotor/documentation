---
title: Кассовые смены
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_session.html
tags: [terminal, java]
folder: java_SDK
---
## Описание

С помощью методов класса [`SystemStateApi.kt`](https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/system/SystemStateApi.kt) приложения получают информацию о кассовой смене.

## Методы

### getLastSessionNumber

```java
fun getLastSessionNumber(context: Context): Long?
```

**Описание**

Получает номер последней кассовой смены.

**Параметры**

* `context` – контекст приложения.

**Возвращает**

* `Long` – номер кассовой смены.

### isSessionOpened

```java
fun isSessionOpened(context: Context): Boolean?
```

**Описание**

Возвращает информацию о состоянии кассовой смены.

**Параметры**

* `context` – контекст приложения.

**Возвращает**

* `true` – смена открыта.
* `false` – смена закрыта.

## Пример

Пример использования методов `SystemStateApi.kt`.

{% include note.html content="Соответствующие кнопки требуется зарегистрировать в манифесте приложения." %}

```java
package com.example.dfabrichnyi.integration_lib_test

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.widget.Button
import ru.evotor.framework.system.SystemStateApi

class IntegrationLibraryApiTestActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        //Вызов суперкласса onCreate, создающего операцию.
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_integration_library_api_test)
        //Кнопка, нажатиже на которую возвращает номер последней кассовой смены.
        findViewById<Button>(R.id.get_last_session_number).setOnClickListener {
            getLastSessionNumber()
        }

        //Кнопка, нажатиже на которую возвращает информацию состоянии кассовой смены.
        findViewById<Button>(R.id.get_is_session_opened).setOnClickListener {
            getIsSessionOpened()
        }
    }

    //Функция, реализующая метод получения номера последней кассовой смены
    //SystemStateApi.getLastSessionNumber()
    private fun getLastSessionNumber() {
        val lastSessionNumber = SystemStateApi.getLastSessionNumber(this)
        if (lastSessionNumber != null) {
            //Выводит на экран номер последней кассовой смены.
            println("lastSessionNumber = $lastSessionNumber")
        } else {
            //Выводит на экран сообщение, если номер кассовой смены получить не удалось.
            println("Не удалось получить номер последней кассовой смены.")
        }
    }

    //Функция, реализующая метод получения информации о состоянии кассовой смены
    //SystemStateApi.isSessionOpened()
    private fun getIsSessionOpened() {
        val isSessionOpened = SystemStateApi.isSessionOpened(this)
        if (isSessionOpened != null) {
            //Выводит на экран состояние текущей кассовой смены.
            println("isSessionOpened = $isSessionOpened")
        } else {
            //Выводит на экран сообщение, если состояние кассовой смены получить не удалось.
            println("Не удалось определить состояние текущей кассовой смены.")
        }
    }
}
```
