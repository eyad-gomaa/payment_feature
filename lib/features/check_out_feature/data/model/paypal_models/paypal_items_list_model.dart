/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

PaypalItemsListModel paypalItemsListModelFromJson(String str) => PaypalItemsListModel.fromJson(json.decode(str));

String paypalItemsListModelToJson(PaypalItemsListModel data) => json.encode(data.toJson());

class PaypalItemsListModel {
    PaypalItemsListModel({
        this.shippingAddress,
        required this.items,
    });

    ShippingAddress? shippingAddress;
    List<Item> items;

    factory PaypalItemsListModel.fromJson(Map<dynamic, dynamic> json) => PaypalItemsListModel(
        shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<dynamic, dynamic> toJson() => {
        "shipping_address": shippingAddress?.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.quantity,
        required this.price,
        required this.name,
        required this.currency,
    });

    int quantity;
    String price;
    String name;
    String currency;

    factory Item.fromJson(Map<dynamic, dynamic> json) => Item(
        quantity: json["quantity"],
        price: json["price"],
        name: json["name"],
        currency: json["currency"],
    );

    Map<dynamic, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
        "name": name,
        "currency": currency,
    };
}

class ShippingAddress {
    ShippingAddress({
        required this.countryCode,
        required this.city,
        required this.phone,
        required this.state,
        required this.recipientName,
        required this.postalCode,
        required this.line2,
        required this.line1,
    });

    String countryCode;
    String city;
    String phone;
    String state;
    String recipientName;
    String postalCode;
    String line2;
    String line1;

    factory ShippingAddress.fromJson(Map<dynamic, dynamic> json) => ShippingAddress(
        countryCode: json["country_code"],
        city: json["city"],
        phone: json["phone"],
        state: json["state"],
        recipientName: json["recipient_name"],
        postalCode: json["postal_code"],
        line2: json["line2"],
        line1: json["line1"],
    );

    Map<dynamic, dynamic> toJson() => {
        "country_code": countryCode,
        "city": city,
        "phone": phone,
        "state": state,
        "recipient_name": recipientName,
        "postal_code": postalCode,
        "line2": line2,
        "line1": line1,
    };
}
