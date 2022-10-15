class Getpassword {
  String? iD;
  String? message;
  int? statusCode;

  Getpassword({this.iD, this.message, this.statusCode});

  Getpassword.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    message = json['Message'];
    statusCode = json['StatusCode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = iD;
    data['Message'] = message;
    data['StatusCode'] = statusCode;
    return data;
  }
}
