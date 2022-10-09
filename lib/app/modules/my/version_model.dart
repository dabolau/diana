class Version {
  List<Datas>? datas;
  String? message;
  int? statusCode;

  Version({this.datas, this.message, this.statusCode});

  Version.fromJson(Map<String, dynamic> json) {
    if (json['Datas'] != null) {
      datas = <Datas>[];
      json['Datas'].forEach((v) {
        datas?.add(Datas.fromJson(v));
      });
    }
    message = json['Message'];
    statusCode = json['StatusCode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (datas != null) {
      data['Datas'] = datas?.map((v) => v.toJson()).toList();
    }
    data['Message'] = message;
    data['StatusCode'] = statusCode;
    return data;
  }
}

class Datas {
  String? id;
  String? name;
  String? version;
  String? description;
  String? url;

  Datas({this.id, this.name, this.version, this.description, this.url});

  Datas.fromJson(Map<String, dynamic> json) {
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
