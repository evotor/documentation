---
title: Ошибки, которые может возвращать сторонний сервис
keywords:
summary: "Раздел содержит информацию о возвращаемых ошибках"
sidebar: evotordoc_sidebar
permalink: doc_errors_returned.html
tags: [cloud]
folder: evotor_api
---

Сторонний сервис должен отвечать на каждый [вебхук](./doc_example_calls.html#webhooks) Облака Эвотор. Ответ стороннего сервиса содержит HTTP-код состояния, в теле ответа обязательно только поле `code`.

## Схема ответа стороннего сервиса

Ниже приведена общая схема ответа стороннего сервиса на вебхук Облака Эвотор

```JSON
{
	"errors": [
		{
			"code": "errorCode1"
		},
		{
			"code": "errorCode2",
			"additionalField1": "field1Value",
			"additionalField2": "field2Value"
		}
	]
}
```

где:

* `errors` – массив объектов ошибок. Обязательное поле.
* `code` – поле, которое содержит код ошибки из [списка возможных ошибок](./doc_errors_returned.html#errorsList). Код ошибки может принимать значения от 0000 до 9999.
* `additionalField` – дополнительное поле. Значение дополнительного поля может определять ответное действие Облака Эвотор.

## Примеры ошибок

### 400 Неверный запрос

Ответ стороннего сервиса на некорректный вебхук Облака будет выглядеть так:

```JSON
{ "errors":
  [
    {
      "code": 2003,
      "reason": "incorrect",
      "subject": "deviceUuid",
      "value": "null"
    }
  ]
}
```

Помимо обязательного поля `code`, объект содержит дополнительные поля которые указывают на ошибку. Дополнительные поля могут отсутствовать или отличаться от приведённых в примере.

### 401 Не авторизован

Ответ стороннего сервиса на неверные данные авторизации, полученные от Облака, будет выглядеть так:

```JSON

{ "errors":
  [
    {
      "code": 1001
    }
  ]
}
```

### 404 Не найдено

Ответ стороннего сервиса если указанный в запросе Облака ресурс не найден:

```JSON
{ }
```

## Таблица ошибок, которые сторонний сервис может возвращать Облаку {#errorsList}

Таблица ниже содержит коды возвращаемых ошибок, которые сторонний сервис может вернуть Облаку, их описания и содержимое ответов.

<table dir="ltr" border="1" cellspacing="0" cellpadding="10"><colgroup><col width="152"> <col width="285"> <col width="35"> <col width="297"></colgroup>

<tbody>

<tr>

<td style="text-align: left;">HTTP-код состояния</td>

<td style="text-align: left;">Описание</td>

<td style="text-align: left;">Код</td>

<td style="text-align: left;">Тело ответа</td>

</tr>

<tr>

<td colspan="1" rowspan="4">

<div>400 Неверный запрос</div>

</td>

</tr>

<tr>

<td>Синтаксическая ошибка в запросе.</td>

<td>2001</td>

<td><pre>
{ "errors":
  [
    { "code": 2001 }
  ]
}
</pre></td>

</tr>

<tr>

<td>В запросе отсутствует обязательное поле или присутствуют неизвестные поля.</td>

<td>2002</td>

<td><pre>
{ "errors":
  [
    {
      "code": 2002,
      "reason": "missing",
      "subject": "deviceUuid"
    },
    {
      "code": 2002,
      "reason": "unexpected",
      "subject": "deviceUuid"
    }
  ]
}
</pre></td>

</tr>

<tr>

<td>Параметры запроса содержат недопустимые значения.</td>

<td>2003</td>

<td><pre>
{ "errors":
  [
    {
      "code": 2003,
      "reason": "incorrect",
      "subject": "deviceUuid",
      "value": "null"
    }
  ]
}
</pre></td>

</tr>

<tr>

<td colspan="1" rowspan="4">

<div>401 Не авторизован</div>

</td>

<td>Неверный токен облака Эвотор.</td>

<td>1001</td>

<td><pre>
{ "errors":
  [
    {
      "code": 1001
    }
  ]
}
</pre></td>

</tr>

<tr>

<td>Неверный токен пользователя.</td>

<td>1002</td>

<td><pre>
{ "errors":
  [
    {
      "code": 1002
    }
  ]
}
</pre></td>

</tr>

<tr>

<td>Истёк срок действия токена пользователя.</td>

<td>1003</td>

<td><pre>
{ "errors":
  [
    {
      "code": 1003
    }
  ]
}
</pre></td>

</tr>

<tr>

<td>При авторизации в стороннем сервисе, пользователь указал неверные данные.</td>

<td>1006</td>

<td><pre>
{ "errors":
  [
    {
      "code": 1006
    }
  ]
}
</pre></td>

</tr>

<tr>

<td>402 Необходима оплата</td>

<td>Подписка для пользователя не активна. Требуется оплата.</td>

<td>1004</td>

<td><pre>
{ "errors":
  [
    {
      "code": 1004,
      "reason": "payment required",
      "subject": "userUuid",
      "value": "01-000000000015463"
    }
  ]
}
</pre></td>

</tr>

<tr>

<td>404 Не найдено</td>

<td>Отсутствует указанный ресурс.</td>

<td>–</td>

</tr>

<tr>

<td colspan="1" rowspan="2">

<div>405 Не поддерживается</div>

</td>

<td>Терминал не активен в рамках текущей подписки. Активируйте терминал и попробуйте ещё раз.</td>

<td>1005</td>

<td><pre>
{ "errors":
  [
    {
      "code": 1005,
      "reason": "not allowed",
      "subject": "deviceUuid",
      "value": "93a9bfa3-7353-490d-aa54-8c6efe9d8a8f"
    }
  ]
}</pre></td>

</tr>

<tr>

<td>Лицензированных терминалов недостаточно для активации в рамках тарифа.</td>

<td>1007</td>

<td><pre>
{ "errors":
  [
    {
      "code": 1007,
      "reason": "license overhead",
      "subject": "deviceUuid",
      "value": "93a9bfa3-7353-490d-aa54-8c6efe9d8a8f"
    }
  ]
}
</pre></td>

</tr>

<tr>

<td colspan="1" rowspan="2">

<div>409 Конфликт</div>

</td>

<td>Ассоциация записей невозможна. В стороннем сервисе userUuid ассоциирован с другой учётной записью пользователя Эвотора.</td>

<td>2004</td>

<td><pre>
{ "errors":
  [
    {
      "code": 2004
    }
  ]
}
</pre></td>

</tr>

<tr>

<td style="text-align: left;">Регистрация невозможна. В стороннем сервисе уже зарегистрирована учётная запись с указанными данными.</td>

<td style="text-align: left;">2005</td>

<td style="text-align: left;"><pre>
{ "errors":
  [
    {
      "code": 2005
    }
  ]
}
</pre></td>

</tr>

</tbody>

</table>
