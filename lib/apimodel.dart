// To parse this JSON data, do
//
//     final apimodel = apimodelFromJson(jsonString);

import 'dart:convert';

Apimodel apimodelFromJson(String str) => Apimodel.fromJson(json.decode(str));

String apimodelToJson(Apimodel data) => json.encode(data.toJson());

// class Apimodel {
//   String message;
//   List<Datum> data;
//   bool success;
//
//   Apimodel({
//     required this.message,
//     required this.data,
//     required this.success,
//   });
//
//   factory Apimodel.fromJson(Map<String, dynamic> json) => Apimodel(
//     message: json["message"],
//     data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     success: json["success"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     "success": success,
//   };
// }

class Apimodel {
  String image;
  String title;
  String body;
  DateTime timestamp;

  Apimodel({
    required this.image,
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory Apimodel.fromJson(Map<String, dynamic> json) => Apimodel(
    image: imageValues.map[json["image"]]!.toString(),
    title: titleValues.map[json["title"]]!.toString(),
    body: json["body"],
    timestamp: DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "image": imageValues.reverse[image],
    "title": titleValues.reverse[title],
    "body": body,
    "timestamp": timestamp.toString(),
  };
}

enum Image {
  ORDER_ASSIGNED_PNG,
  ORDER_CANCELLED_PNG,
  ORDER_DELIVERED_PNG,
  PROMOTION_MARKETPLACE_PNG,
  PROMOTION_NOTIFY_PNG,
  SUPPORT_PERSONNEL_PNG
}

final imageValues = EnumValues({
  "order_assigned.png": Image.ORDER_ASSIGNED_PNG,
  "order_cancelled.png": Image.ORDER_CANCELLED_PNG,
  "order_delivered.png": Image.ORDER_DELIVERED_PNG,
  "promotion_marketplace.png": Image.PROMOTION_MARKETPLACE_PNG,
  "promotion_notify.png": Image.PROMOTION_NOTIFY_PNG,
  "support_personnel.png": Image.SUPPORT_PERSONNEL_PNG
});

enum Title {
  GET_UP_TO_INR_100_CASHBACK_USING_GOOGLEPAY,
  HURRY_TODAY_MEGA_SALE_IN_D_MART,
  ORDER_CANCELLED,
  ORDER_DELIVERED,
  SUPPORT_TICKET_STATUS,
  YOUR_ORDER_HAS_BEEN_ASSIGNED
}

final titleValues = EnumValues({
  "Get up to INR 100/-cashback using googlepay": Title.GET_UP_TO_INR_100_CASHBACK_USING_GOOGLEPAY,
  "‘Hurry’Today Mega sale in D-mart": Title.HURRY_TODAY_MEGA_SALE_IN_D_MART,
  "Order Cancelled": Title.ORDER_CANCELLED,
  "Order Delivered": Title.ORDER_DELIVERED,
  "Support ticket status": Title.SUPPORT_TICKET_STATUS,
  "Your order has been assigned": Title.YOUR_ORDER_HAS_BEEN_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
