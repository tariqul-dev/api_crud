import 'dart:convert';

LoginInfo loginInfoFromJson(String str) => LoginInfo.fromJson(json.decode(str));

String loginInfoToJson(LoginInfo data) => json.encode(data.toJson());

class LoginInfo {
  LoginInfo({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
        token: json["token"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
        userDisplayName: json["user_display_name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user_email": userEmail,
        "user_nicename": userNicename,
        "user_display_name": userDisplayName,
      };
}
