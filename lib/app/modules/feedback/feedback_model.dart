class Feedback {
  Data? data;
  String? message;
  int? statusCode;

  Feedback({this.data, this.message, this.statusCode});

  Feedback.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? Data?.fromJson(json['Data']) : null;
    message = json['Message'];
    statusCode = json['StatusCode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['Data'] = data[0]?.toJson();
    }
    data['Message'] = message;
    data['StatusCode'] = statusCode;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  String? email;

  Data({this.id, this.name, this.description, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    name = json['Name'];
    description = json['Description'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = id;
    data['Name'] = name;
    data['Description'] = description;
    data['Email'] = email;
    return data;
  }
}
