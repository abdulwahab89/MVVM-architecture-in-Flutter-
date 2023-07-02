import 'dart:convert';

/// token : "QpwL5tke4Pnpja7X4"

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    String? token,
  }) {
    _token = token;
  }

  UserModel.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
  UserModel copyWith({
    String? token,
  }) =>
      UserModel(
        token: token ?? _token,
      );
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }
}
