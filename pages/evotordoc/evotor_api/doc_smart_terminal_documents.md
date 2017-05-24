---
title: Документы смарт-терминала
keywords: sample
summary: "Раздел содержит список документов, которые формирует смарт-терминал."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_documents.html
folder: evotordoc/evotor_integration
---

При организации товарно-денежных операций, смарт-терминал создаёт и обменивается _документами_. Документ – JSON-файл с информацией о транзакциях (действиях), выполненных на смарт-терминале, например, открытие или закрытие смены, продажа товара. Как и другая информация пользователей платформы, документы хранятся в облаке Эвотор. Порядок транзакций важен при чтении документа.

<table dir="ltr" border="1" cellspacing="0" cellpadding="10"><colgroup><col width="261"> <col width="217"></colgroup>

<tbody>

<tr>

<td style="text-align: center;" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0422\u0438\u043f&quot;}"><b>Тип</b></td>

<td style="text-align: center;" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435&quot;}"><b>Название</b></td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;ACCEPT&quot;}">ACCEPT</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0440\u0438\u0451\u043c\u043a\u0430&quot;}">Приёмка</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;SELL&quot;}">SELL</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0440\u043e\u0434\u0430\u0436\u0430&quot;}">Продажа</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;PAYBACK&quot;}">PAYBACK</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0412\u043e\u0437\u0432\u0440\u0430\u0442 \u0434\u0435\u043d\u0435\u0433&quot;}">Возврат денег</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;CASH_INCOME&quot;}">CASH_INCOME</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0412\u043d\u0435\u0441\u0435\u043d\u0438\u0435 \u043d\u0430\u043b\u0438\u0447\u043d\u044b\u0445&quot;}">Внесение наличных</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;CASH_OUTCOME&quot;}">CASH_OUTCOME</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0418\u0437\u044a\u044f\u0442\u0438\u0435 \u043d\u0430\u043b\u0438\u0447\u043d\u044b\u0445&quot;}">Изъятие наличных</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;CLOSE_SESSION&quot;}">CLOSE_SESSION</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u0441\u043c\u0430\u0440\u0442-\u0442\u0435\u0440\u043c\u0438\u043d\u0430\u043b\u0430&quot;}">Закрытие смены смарт-терминала</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;OPEN_SESSION&quot;}">OPEN_SESSION</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u0441\u043c\u0430\u0440\u0442-\u0442\u0435\u0440\u043c\u0438\u043d\u0430\u043b\u0430&quot;}">Открытие смены смарт-терминала</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;INVENTORY&quot;}">INVENTORY</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0418\u043d\u0432\u0435\u043d\u0442\u0430\u0440\u0438\u0437\u0430\u0446\u0438\u044f&quot;}">Инвентаризация</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;WRITE_OFF&quot;}">WRITE_OFF</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0421\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0442\u043e\u0432\u0430\u0440\u0430&quot;}">Списание товара</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RETURN&quot;}">RETURN</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0412\u043e\u0437\u0432\u0440\u0430\u0442 \u0442\u043e\u0432\u0430\u0440\u0430 \u043f\u043e\u0441\u0442\u0430\u0432\u0449\u0438\u043a\u0443&quot;}">Возврат товара поставщику</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;REVALUATION&quot;}">REVALUATION</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0435\u0440\u0435\u043e\u0446\u0435\u043d\u043a\u0430&quot;}">Переоценка</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;FPRINT (Transaction:FPRINT_X_REPORT)&quot;}">FPRINT (Transaction:FPRINT_X_REPORT)</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0435\u0447\u0430\u0442\u044c X-\u043e\u0442\u0447\u0451\u0442\u0430&quot;}">Печать X-отчёта</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;FPRINT (Transaction:FPRINT_Z_REPORT)&quot;}">FPRINT (Transaction:FPRINT_Z_REPORT)</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0435\u0447\u0430\u0442\u044c Z-\u043e\u0442\u0447\u0451\u0442\u0430&quot;}">Печать Z-отчёта</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;FPRINT (Transaction:OPEN_SESSION)&quot;}">FPRINT (Transaction:OPEN_SESSION)</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u041a\u041a\u041c&quot;}">Закрытие смены ККМ</td>

</tr>

</tbody>

</table>

  Со структурой всех типов документов смарт-терминала вы можете ознакомиться [в нашем репозитории](https://github.com/evotor/documentation-api/tree/master/pos-docs).
