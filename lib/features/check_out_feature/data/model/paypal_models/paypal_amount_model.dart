/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

PaypalAmountModel paypalAmountModelFromJson(String str) => PaypalAmountModel.fromJson(json.decode(str));

String paypalAmountModelToJson(PaypalAmountModel data) => json.encode(data.toJson());

class PaypalAmountModel {
    PaypalAmountModel({
        required this.total,
        required this.currency,
        required this.details,
    });

    String total;
    String currency;
    Details details;

    factory PaypalAmountModel.fromJson(Map<dynamic, dynamic> json) => PaypalAmountModel(
        total: json["total"],
        currency: json["currency"],
        details: Details.fromJson(json["details"]),
    );

    Map<dynamic, dynamic> toJson() => {
        "total": total,
        "currency": currency,
        "details": details.toJson(),
    };
}

class Details {
    Details({
        required this.shipping,
        required this.shippingDiscount,
        required this.subtotal,
    });

    String shipping;
    int shippingDiscount;
    String subtotal;

    factory Details.fromJson(Map<dynamic, dynamic> json) => Details(
        shipping: json["shipping"],
        shippingDiscount: json["shipping_discount"],
        subtotal: json["subtotal"],
    );

    Map<dynamic, dynamic> toJson() => {
        "shipping": shipping,
        "shipping_discount": shippingDiscount,
        "subtotal": subtotal,
    };
}
