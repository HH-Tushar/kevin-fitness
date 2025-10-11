import 'dart:convert';

class SubscriptionModel {
    final int count;
    // final dynamic next;
    // final dynamic previous;
    final List<Package> results;

    SubscriptionModel({
        required this.count,
        // required this.next,
        // required this.previous,
        required this.results,
    });

    factory SubscriptionModel.fromRawJson(String str) => SubscriptionModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubscriptionModel.fromJson(Map<String, dynamic> json) => SubscriptionModel(
        count: json["count"],
        // next: json["next"],
        // previous: json["previous"],
        results: List<Package>.from(json["results"].map((x) => Package.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        // "next": next,
        // "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Package {
    final int id;
    final String name;
    final String description;
    final dynamic image;
    final bool recurring;
    final double amount;
    final String billingInterval;
    final int intervalCount;
    final String priceId;
    final String productId;
    final String status;

    Package({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.recurring,
        required this.amount,
        required this.billingInterval,
        required this.intervalCount,
        required this.priceId,
        required this.productId,
        required this.status,
    });

    factory Package.fromRawJson(String str) => Package.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        recurring: json["recurring"],
        amount: json["amount"],
        billingInterval: json["billing_interval"],
        intervalCount: json["interval_count"],
        priceId: json["price_id"],
        productId: json["product_id"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "recurring": recurring,
        "amount": amount,
        "billing_interval": billingInterval,
        "interval_count": intervalCount,
        "price_id": priceId,
        "product_id": productId,
        "status": status,
    };
}
