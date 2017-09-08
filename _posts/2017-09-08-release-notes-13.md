---
title:  "08.09.2017"
summary:
categories: what's new
permalink: 2017-09-08-release-notes-13.html
tags:
---

Изменения:

* Добавлено описание [событий установки и удаления приложений](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v2~1installation~1event%2Fpost).
* В [модель товара](https://api.evotor.ru/docs/#tag/Tovary-i-dokumenty%2Fpaths%2F~1api.evotor.ru~1api~1v1~1inventories~1stores~1%7BstoreUuid%7D~1products%2Fpost) добавлено новое значение поля тип товара – `SERVICE` (услуга). Поле остатков неприменимо для услуг.
* Теперь при обмене со сторонними сервисами терминалы могут использовать тип данных `multipart/form-data`. Изменение отражено в соответствующих [разделах документации](./doc_java_third_party_service_communication.html).
