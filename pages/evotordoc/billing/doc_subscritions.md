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

Чтобы ваш сервис узнавал об установке приложения, его удалении или каких-либо изменениях в подписках, Облако Эвотор передаёт сервису [*события установки и удаления приложения*](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v2~1installation~1event%2Fpost) и [*события подписки*](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1subscription~1event%2Fpost).

{% include note.html content="Облако передаёт события в течение трёх дней до тех пор, пока сторонний сервис не ответит 200 ОК." %}

## Жизненный цикл подписки

Этапы жизненного цикла подписки:

* *Пробный этап*. Подписка переходит на этот этап после установки приложения, если тариф предусматривает наличие пробного периода использования приложения. Пробный этап заканчивается в установленный срок после успешной оплаты тарифа (событие `subscriptionActivated`).

* *Активный этап (или этап биллинга)*. Подписка переходит на этот этап после успешной оплаты тарифа. Этап длится в течение срока, заданного в тарифе. Этап оканчивается с очередной оплатой  (событие `subscriptionRenewed`), после которой начинается новый этап биллинга.

* *Этап напоминаний (или этап даннинга)*. Этот этап начинается если пользователь не продлил подписку на приложение в срок, заданный в тарифе. Облако выполняет попытки списать средства раз в день в течение пяти дней с момента окончания подписки.

  Если по истечению пяти дней списать средства не удалось, Облако передаёт событие `subscriptionTerminated`, которое сообщает о завершении подписки, после чего приложение автоматически удаляется из Личного Кабинета и с устройств пользователя (событие `ApplicationUninstalled`).

  Если Облаку удаётся выполнить списание средств в течение пяти дней (событие `subscriptionRenewed`), начинается очередной этап биллинга.

## Порядок распространения событий

### Подписка на приложение

При подписке на приложение, Облако Эвотор передаёт события в следующем порядке:

1. После того как пользователь устанавливает приложение в [Личном Кабинете](https://lk.evotor.ru/web/login), Облако передаёт событие `subscriptionCreated`.

   Также, после события `subscriptionCreated`, Облако передаёт событие `ApplicationInstalled`.

2. По истечению пробного периода:

   * Если пользователь оплачивает приложение, Облако передаёт событие `subscriptionActivated`.

     Событие `subscriptionActivated` сообщает об успешной оплате приложения.

   * Если пользователь не оплачивает приложение, Облако передаёт событие `subscriptionTerminated`.

     Событие `subscriptionTerminated` сообщает о том, что регулярная оплата приложения не прошла.

3. После того как пользователь удаляет приложение до истечения оплаченного или пробного периода, Облако передаёт событие `subscriptionTerminationRequested`.

   Также, после удаления приложения, Облако передаёт событие `ApplicationUninstalled`.

4. После успешной оплаты очередного периода и продления использования приложения, Облако передаёт событие `subscriptionRenewed`.

5. После того как пользователь изменяет условия подписки на приложение (например, тарифный план или количество устройств) в течение оплаченного или пробного периода, Облако передаёт событие `SubscriptionTermsChanged`.

6. Если в течение оплаченного или пробного периода пользователь переустанавливает приложение с новым тарифным планом, Облако передаёт следующие события:

   1. `subscriptionTerminationRequested`.
   2. `subscriptionRenewed`.
   3. `SubscriptionTermsChanged`.

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

   Также, после события `subscriptionCreated`, Облако передаёт событие `ApplicationInstalled`.

2. По истечению пробного периода:

   * Если пользователь оплачивает приложение, Облако передаёт событие `subscriptionActivated`.

   * Если пользователь не оплачивает приложение, Облако передаёт событие `subscriptionTerminated`.

   {% include note.html content="Если у приложения нет пробного периода, Облако передаёт событие `subscriptionActivated` сразу после события `subscriptionCreated`." %}

3. После того как пользователь удаляет приложение, Облако передаёт событие `ApplicationUninstalled`.

{% include tip.html content="Суммируйте различные подписки (`subscriptionId`) в рамках одного пользователя. Это поможет определить на сколько устройств пользователь установил приложение." %}

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
@enduml -->
