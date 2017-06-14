---
title: Создание чека в приложении
keywords: sample
summary: Раздел содержит информацию о том, как приложение может передать сформированный чек в смарт-терминал для оплаты.
sidebar: evotordoc_sidebar
permalink: doc_receipt_creation.html
folder: smart_terminal_SDK
---

Чтобы передать сформированный чек:

1. Составьте список позиций, который требуется добавить в чек, наполните список

    {% highlight java %}
    public void openReceipt() {
            List<PositionAdd> positionAddList = new ArrayList<>();

            JSONObject extra = new JSONObject();
    {% endhighlight %}

  Где:

  `List<PositionAdd> positionAddList = new ArrayList<>()`– список позиций. Как добавить позицию в чек смотрите в **Списке возможных изменений**, в разделе [**Работа с чеком**](./doc_receipt_interactions.html).

  `JSONObject extra = new JSONObject();`– добавляет дополнительные данные к чеку. Данные доступны только вашему приложению. Не создавайте этот объект, если приложение не добавляет дополнительные поля к чеку.

2. Создайте команду открытия чека и вызовите метод `.process`
{% highlight java %}
new OpenSellReceiptCommand(positionAddList, new SetExtra(object)).process(
                        activity,
                        new IntegrationManagerCallback() {
                            @Override
                            public void run(IntegrationManagerFuture integrationManagerFuture) {
                                try {
                                    IntegrationManagerFuture.Result result = integrationManagerFuture.getResult();
                                    if (result.getType() == IntegrationManagerFuture.Result.Type.OK) {
                                        startActivity(new Intent("evotor.intent.action.payment.SELL"));
                                    }
                                } catch (IOException e) {
                                    e.printStackTrace();
                                } catch (IntegrationException e) {
                                    e.printStackTrace();
                                }
                            }
                        });
{% endhighlight %}

Где:

`new SetExtra(extra)`– задаёт дополнительные данные чека. Если дополнительных данных нет указывайте `null`.
