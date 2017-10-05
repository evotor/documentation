---
title: Подписки
keywords: биллинг, подписка, события
summary:
sidebar: evotordoc_sidebar
permalink: doc_subscriptions.html
tags: [billing]
folder: billing
---

Согласно разделу [Тарифы](./doc_tariffs.html), вы можете распространять своё приложение как по подписочной модели, так и за разовые платежи.

Чтобы ваш сервис узнавал о установке приложения, его удалении или каких-либо изменениях в подписках Облако Эвотор передаёт сервису и [*события подписки*](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1subscription~1event%2Fpost).

## Порядок распространения событий

### Подписка на приложение

При подписке на приложение, Облако Эвотор передаёт события в следующем порядке:

1. После того как пользователь устанавливает приложение в [Личном Кабинете](https://lk.evotor.ru/web/login), Облако передаёт событие `subscriptionCreated`.
2. По истечению пробного периода:

   * Если пользователь оплачивает приложение, Облако передаёт событие `subscriptionActivated`.

     Событие `subscriptionActivated` сообщает об успешной оплате приложения.

   * Если пользователь не оплачивает приложение, Облако передаёт событие `subscriptionTerminated`.

     Событие `subscriptionTerminated` сообщает о том, что регулярная оплата приложения не прошла.

3. После того как пользователь удаляет приложение, Облако передаёт событие `subscriptionTerminationRequested`.

   Облако передаёт `subscriptionTerminationRequested` когда пользователь удаляет приложения до истечения оплаченного или пробного периода.

4. После того как пользователь повторно установил приложение в течение оплаченного или пробного периода, Облако передаёт событие `subscriptionRenewed`.

   Облако так же передаёт `subscriptionRenewed` после успешной оплаты очередного периода и продления использования приложения.

5. Если пользователь изменил условия подписки (например, тарифный план или количество устройств), до истечения оплаченного или пробного периода, Облако передаёт событие `SubscriptionTermsChanged`.

   Если пользователь переустановил приложение с новым тарифным планом в течение оплаченного или пробного периода, Облако передаёт события `subscriptionRenewed`, а потом `SubscriptionTermsChanged`.

Ниже представлена диаграмма распространения событий при подписке на приложение.

{% include image.html file="subscription_events_diagram.png" url="images/subscription_events_diagram.png" caption="Диаграмма распространения событий" %}

<!-- @startuml
title Диаграмма распространения событий при подписочной модели

state "Подписка оформлена " as CREATED
CREATED: Подписка в пробном периоде или или ожидает оплату
state "Подписка неактивна" as TERMINATED
TERMINATED: Подписка не оплачена
state "Подписка актива" as ACTIVATED
ACTIVATED: Подписка оплачена

[*]->CREATED:(1)SubscriptionCreated
CREATED -down-> ACTIVATED:(2)SubscriptionActivated
CREATED -down->TERMINATED:(3)SubscriptionTerminated
CREATED ->CREATED:(6)SubscriptionTermsChanged
CREATED ->CREATED:(7)SubscriptionTerminationRequested
CREATED ->CREATED:(8)SubscriptionRenewed
ACTIVATED -up->TERMINATED:(4)SubscriptionTerminated
ACTIVATED ->ACTIVATED:(9)SubscriptionTermsChanged
ACTIVATED ->ACTIVATED:(10)SubscriptionTerminationRequested
ACTIVATED ->ACTIVATED:(11)SubscriptionRenewed
TERMINATED-down->ACTIVATED:(5)SubscriptionRenewed
@enduml -->

### Разовая оплата приложения

При разовой оплате приложения, Облако Эвотор передаёт события в следующем порядке:

1. После того как пользователь устанавливает приложение в [Личном Кабинете](https://lk.evotor.ru/web/login), Облако передаёт событие `subscriptionCreated`.
2. По истечению пробного периода:

   * Если пользователь оплачивает приложение, Облако передаёт событие `subscriptionActivated`.

     Событие `subscriptionActivated` сообщает об успешной оплате приложения.

   * Если пользователь не оплачивает приложение, Облако передаёт событие `subscriptionTerminated`.
   {% include note.html content="Если у приложения нет пробного периода, Облако передаёт событие `subscriptionActivated` сразу после события `subscriptionCreated`." %}
3. После того как пользователь удаляет приложение, Облако передаёт событие `subscriptionTerminated`.

Ниже представлена диаграмма распространения событий при разовой оплате приложения.

{% include image.html file="OTP_events_diagram.png" url="images/OTP_events_diagram.png" caption="Диаграмма распространения событий" %}

<!-- @startuml
title Диаграмма распространения событий при разовой оплате

state "Подписка оформлена " as CREATED
CREATED: Подписка в пробном периоде или ожидает оплату
state "Подписка неактивна" as TERMINATED
TERMINATED: Подписка не оплачена
state "Подписка активна" as ACTIVATED
ACTIVATED: Подписка оплачена

[*]->CREATED:(1)SubscriptionCreated
CREATED -down-> ACTIVATED:(2)SubscriptionActivated
CREATED -down->TERMINATED:(3)SubscriptionTerminated
ACTIVATED ->TERMINATED:(3)SubscriptionTerminated
@enduml -->
