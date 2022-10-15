class Login {
  String? iD;
  String? bearerToken;
  String? message;
  int? statusCode;

  Login({this.iD, this.bearerToken, this.message, this.statusCode});

  Login.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    bearerToken = json['BearerToken'];
    message = json['Message'];
    statusCode = json['StatusCode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = iD;
    data['BearerToken'] = bearerToken;
    data['Message'] = message;
    data['StatusCode'] = statusCode;
    return data;
  }
}
