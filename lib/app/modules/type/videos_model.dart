class Videos {
  List<Datas>? datas;
  String? message;
  int? statusCode;

  Videos({this.datas, this.message, this.statusCode});

  Videos.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? name;
  String? category;
  String? type;
  String? area;
  String? language;
  String? director;
  String? actor;
  String? year;
  String? score;
  String? status;
  String? description;
  String? picture;
  List<URLs>? urls;

  Datas(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.category,
      this.type,
      this.area,
      this.language,
      this.director,
      this.actor,
      this.year,
      this.score,
      this.status,
      this.description,
      this.picture,
      this.urls});

  Datas.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    deletedAt = json['DeletedAt'];
    name = json['Name'];
    category = json['Category'];
    type = json['Type'];
    area = json['Area'];
    language = json['Language'];
    director = json['Director'];
    actor = json['Actor'];
    year = json['Year'];
    score = json['Score'];
    status = json['Status'];
    description = json['Description'];
    picture = json['Picture'];
    if (json['URLs'] != null) {
      urls = <URLs>[];
      json['URLs'].forEach((v) {
        urls?.add(URLs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = id;
    data['CreatedAt'] = createdAt;
    data['UpdatedAt'] = updatedAt;
    data['DeletedAt'] = deletedAt;
    data['Name'] = name;
    data['Category'] = category;
    data['Type'] = type;
    data['Area'] = area;
    data['Language'] = language;
    data['Director'] = director;
    data['Actor'] = actor;
    data['Year'] = year;
    data['Score'] = score;
    data['Status'] = status;
    data['Description'] = description;
    data['Picture'] = picture;
    if (urls != null) {
      data['URLs'] = urls?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class URLs {
  String? name;
  String? url;

  URLs({this.name, this.url});

  URLs.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    url = json['URL'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Name'] = name;
    data['URL'] = url;
    return data;
  }
}
