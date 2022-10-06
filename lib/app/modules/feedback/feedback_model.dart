// To parse this JSON data, do
//
//     final feedback = feedbackFromJson(jsonString);

import 'dart:convert';

Feedback feedbackFromJson(String str) => Feedback.fromJson(json.decode(str));

String feedbackToJson(Feedback data) => json.encode(data.toJson());

class Feedback {
    Feedback({
        this.data,
        this.message,
        this.statusCode,
    });

    Data? data;
    String? message;
    int? statusCode;

    factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        data: Data.fromJson(json["Data"]),
        message: json["Message"],
        statusCode: json["StatusCode"],
    );

    Map<String, dynamic> toJson() => {
        "Data": data?.toJson(),
        "Message": message,
        "StatusCode": statusCode,
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.description,
        this.email,
    });

    String? id;
    String? name;
    String? description;
    String? email;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        name: json["Name"],
        description: json["Description"],
        email: json["Email"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "Description": description,
        "Email": email,
    };
}
