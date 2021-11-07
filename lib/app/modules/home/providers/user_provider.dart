import 'dart:convert';

import 'package:api_crud/app/constants/names.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../user_model.dart';

class UserProvider {
  final box = GetStorage();

  Future<User?> getUserInfo() async {
    String token = box.read(userToken).toString();
    // 'Bearer eyJ0eXAiOiJKV0'
    var headers = {'Authorization': 'Bearer $token'};
    var request = Request('POST',
        Uri.parse('https://apptest.dokandemo.com/wp-json/wp/v2/users/me'));
    request.body = '''''';
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      return userFromJson(data);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<bool> updateUser(Map body) async {
    String token = box.read(userToken).toString();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var request = Request('POST',
        Uri.parse('https://apptest.dokandemo.com/wp-json/wp/v2/users/me'));
    request.body = json.encode(body);
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
