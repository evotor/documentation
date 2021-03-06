---
title: Жизненый цикл версии приложения
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_app_version_lifespan.html
tags: []
folder: evotor_about
---

На сайте разработчиков [dev.evotor.ru](https://dev.evotor.ru) вы можете одновременно работать с несколькими версиями приложения.

Одновременно у вас не может быть более трёх версий приложения:

* два черновика;
* опубликованная версия.

{% include important.html content="Черновик может быть одобрен и готов к публикации. Изменять такой черновик нельзя." %}

Версия приложения может находиться в одном из состояний:

* Черновик;
* Черновик в тестировании;
* Черновик на ревью;
* Одобренный черновик, готовый к публикации;
* Опубликованная версия.

## Черновики приложения

Диаграмма состояний черновиков приложения:

  {: .center-image}
  ![](images/draft_diagram.png)

Используйте черновики приложения для:

* подготовки страницы приложения в [Магазине приложений](https://market.evotor.ru);
* настройки параметров серверной Интеграции приложения;
* тестирования новых версий APK приложения.

Черновик приложения может быть:

* Доступен для тестирования.
  Черновик становится доступным для тестирования сразу после создания, а также после сохранения любых изменений, например, обновления APK, изменения оформления страницы приложения в Магазине или изменения параметров Интеграции. Вы можете [выложить черновик на тест](./doc_app_testing.html) или передать его в модерацию (на ревью). Статус черновика: *Черновик*.

  {% include image.html file="draft.png" url="images/draft.png" caption="Черновик доступен для тестирования" %}

* В тестировании.
  Вы переводите черновик в это состояние по нажатию кнопки **Выложить на тест**. Эту версию приложения могут установить [пользователи с ролью тестировщик](./doc_app_testing.html). Если вы сделаете изменения в черновике он вернётся в состояние *доступен для тестирования*, также, вы можете передать черновик в модерацию (на ревью). Статус черновика: *В тестировании*.

  {% include image.html file="draft_testing.png" url="images/draft_testing.png" caption="Черновик в тестировании" %}

* На ревью.
  Вы переводите черновик в это состояние по нажатию кнопки **На ревью**. Вы не можете изменять черновик приложения, когда он находится на модерации. Возможны два результата модерации:

  * Черновик одобрен. В этом случае черновик переходит в состояние *готов к публикации*.
  * Черновик не одобрен. В этом случае черновик возвращается в исходное состояние: *доступен для тестирования* иои *в тестировании*.

  {% include image.html file="draft_reviewing.png" url="images/draft_reviewing.png" caption="Черновик на модерации" %}

* Готов к публикации.

  Черновик прошёл модерацию и одобрен нашими сотрудниками. Вы не можете изменять одобренный черновик приложения. Вы можете самостоятельно опубликовать данную версию приложения.

  {% include important.html content="Если у вас уже есть опубликованная версия приложения, её автоматически заменит новая. Текущая опубликованная версия будет перенесена в архив. В архиве может находиться неограниченное количество версий приложения. Восстановить версию приложения из архива нельзя." %}

## Опубликованная версия приложения

Опубликованная версия приложения доступна для загрузки в [Магазине приложений](https://market.evotor.ru) для всех пользователей Эвотора.

{% include warning.html content="Если вы снимите приложение с публикации, оно станет недоступно пользователям Эвотора." %}
