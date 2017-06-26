---
title: Возвращаемые ошибки
keywords: sample
summary: "Раздел содержит информацию о возвращаемых ошибках"
sidebar: evotordoc_sidebar
permalink: doc_errors_returned.html
tags: [Облако]
folder: evotordoc/evotor_integration
---

В ответ на каждый запрос, который принимает или отправляет облако Эвотор, приходит HTTP-код состояния. В теле ответа обязательно только поле `code`. Таблица ниже содержит коды возвращаемых ошибок, их описания и содержимое ответов.

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
