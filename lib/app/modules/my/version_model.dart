class Version {
  Data? data;
  String? message;
  int? statusCode;

  Version({this.data, this.message, this.statusCode});

  Version.fromJson(Map<String, dynamic> json) {
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
  String? version;
  String? description;
  String? url;

  Data({this.id, this.name, this.version, this.description, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    name = json['Name'];
    version = json['Version'];
    description = json['Description'];
    url = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = id;
    data['Name'] = name;
    data['Version'] = version;
    data['Description'] = description;
    data['URL'] = url;
    return data;
  }
}
