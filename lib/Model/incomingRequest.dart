import 'dart:convert';

Request postModelFromJson(String str) => Request.fromJson(json.decode(str));

List<Request> postsFromJson3(String str) =>
    List<Request>.from(json.decode(str).map((x) => Request.fromJson(x)));

String postModelToJson(Request data) => json.encode(data.toJson());

class Request {
    String? pickup;
    String? dropup;
    int? fare;
    bool? status;
    String? clientName;
    String? phone;
    int? id;

    Request({
        this.pickup,
        this.dropup,
        this.fare,
        this.status,
        this.clientName,
        this.phone,
        this.id,
    });

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        pickup: json["pickup"],
        dropup: json["dropup"],
        fare: json["fare"],
        status: json["status"],
        clientName: json["clientName"],
        phone: json["phone"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "pickup": pickup,
        "dropup": dropup,
        "fare": fare,
        "status": status,
        "clientName": clientName,
        "phone": phone,
        "id": id,
    };
}
