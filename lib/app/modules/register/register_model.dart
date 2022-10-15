class Register {
  String? iD;
  String? message;
  int? statusCode;

  Register({this.iD, this.message, this.statusCode});

  Register.fromJson(Map<String, dynamic> json) {
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
