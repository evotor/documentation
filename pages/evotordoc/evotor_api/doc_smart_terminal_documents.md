---
title: Документы смарт-терминала
keywords:
summary: "Раздел содержит список документов, которые формирует смарт-терминал."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_documents.html
tags: [Cloud, Terminal, Receipts]
folder: evotor_api
---

При организации товарно-денежных операций, смарт-терминал создаёт и обменивается *документами*.

Документ – JSON-файл с информацией о транзакциях (действиях), выполненных на смарт-терминале, например, открытие или закрытие смены, продажа товара. Как и другая информация пользователей платформы, документы хранятся в облаке Эвотор. Порядок транзакций важен при чтении документа.

<table dir="ltr" border="1" cellspacing="0" cellpadding="10"><colgroup><col width="261"> <col width="217"></colgroup>

<tbody>

<tr>

<td style="text-align: center;" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0422\u0438\u043f&quot;}"><b>Тип</b></td>

<td style="text-align: center;" data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041d\u0430\u0437\u0432\u0430\u043d\u0438\u0435&quot;}"><b>Название</b></td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;ACCEPT&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/01-ACCEPT.json">ACCEPT</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0440\u0438\u0451\u043c\u043a\u0430&quot;}">Приёмка</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;SELL&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/02-SELL.json">SELL</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0440\u043e\u0434\u0430\u0436\u0430&quot;}">Продажа</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;BUY&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/14-BUY.json">BUY</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0440\u043e\u0434\u0430\u0436\u0430&quot;}">Выкуп товара у клиента, с увеличением остатка. Например, при приёме цветного металла.</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;PAYBACK&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/03-PAYBACK.json">PAYBACK</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0412\u043e\u0437\u0432\u0440\u0430\u0442 \u0434\u0435\u043d\u0435\u0433&quot;}">Возврат денег</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;PAYBACK&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/15-BUYBACK.json">BUYBACK</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0412\u043e\u0437\u0432\u0440\u0430\u0442 \u0434\u0435\u043d\u0435\u0433&quot;}">Выкуп товара клиентом, с уменьшением остатка. Например, выкуп залога в ломбарде.</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;CASH_INCOME&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/04-CASH_INCOME.json">CASH_INCOME</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0412\u043d\u0435\u0441\u0435\u043d\u0438\u0435 \u043d\u0430\u043b\u0438\u0447\u043d\u044b\u0445&quot;}">Внесение наличных</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;CASH_OUTCOME&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/05-CASH_OUTCOME.json">CASH_OUTCOME</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0418\u0437\u044a\u044f\u0442\u0438\u0435 \u043d\u0430\u043b\u0438\u0447\u043d\u044b\u0445&quot;}">Изъятие наличных</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;CLOSE_SESSION&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/06-CLOSE_SESSION.json">CLOSE_SESSION</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u0441\u043c\u0430\u0440\u0442-\u0442\u0435\u0440\u043c\u0438\u043d\u0430\u043b\u0430&quot;}">Закрытие смены смарт-терминала</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;OPEN_SESSION&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/07-OPEN_SESSION.json">OPEN_SESSION</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u0441\u043c\u0430\u0440\u0442-\u0442\u0435\u0440\u043c\u0438\u043d\u0430\u043b\u0430&quot;}">Открытие смены смарт-терминала</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;INVENTORY&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/08-INVENTORY.json">INVENTORY</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0418\u043d\u0432\u0435\u043d\u0442\u0430\u0440\u0438\u0437\u0430\u0446\u0438\u044f&quot;}">Инвентаризация</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;WRITE_OFF&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/09-WRITE_OFF.json">WRITE_OFF</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0421\u043f\u0438\u0441\u0430\u043d\u0438\u0435 \u0442\u043e\u0432\u0430\u0440\u0430&quot;}">Списание товара</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;RETURN&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/10-RETURN.json">RETURN</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0412\u043e\u0437\u0432\u0440\u0430\u0442 \u0442\u043e\u0432\u0430\u0440\u0430 \u043f\u043e\u0441\u0442\u0430\u0432\u0449\u0438\u043a\u0443&quot;}">Возврат товара поставщику</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;REVALUATION&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/11-REVALUATION.json">REVALUATION</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0435\u0440\u0435\u043e\u0446\u0435\u043d\u043a\u0430&quot;}">Переоценка</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;FPRINT (Transaction:FPRINT_X_REPORT)&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/12-FPRINT_X_REPORT.json">FPRINT (Transaction:FPRINT_X_REPORT)</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0435\u0447\u0430\u0442\u044c X-\u043e\u0442\u0447\u0451\u0442\u0430&quot;}">Печать X-отчёта</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;FPRINT (Transaction:FPRINT_Z_REPORT)&quot;}"><a href="https://github.com/evotor/documentation-api/blob/master/pos-docs/13-FPRINT-Z-REPORT.json">FPRINT (Transaction:FPRINT_Z_REPORT)</a></td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u041f\u0435\u0447\u0430\u0442\u044c Z-\u043e\u0442\u0447\u0451\u0442\u0430&quot;}">Печать Z-отчёта</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;FPRINT (Transaction:CLOSE_SESSION)&quot;}">FPRINT (Transaction:CLOSE_SESSION)</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u041a\u041a\u041c&quot;}">Закрытие смены ККМ</td>

</tr>

<tr>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;OPEN_TARE&quot;}">OPEN_TARE</td>

<td data-sheets-value="{&quot;1&quot;:2,&quot;2&quot;:&quot;\u0417\u0430\u043a\u0440\u044b\u0442\u0438\u0435 \u0441\u043c\u0435\u043d\u044b \u041a\u041a\u041c&quot;}">Вскрытие тары алкогольной продукции</td>

</tr>

</tbody>

</table>

Со структурой всех типов документов смарт-терминала вы можете ознакомиться [в нашем репозитории на гитхабе](https://github.com/evotor/documentation-api/tree/master/pos-docs).
