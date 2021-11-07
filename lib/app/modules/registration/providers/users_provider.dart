import 'dart:convert';
import 'package:http/http.dart';

class UsersProvider {
  Future<String?> registration(Map body) async {
    var headers = {'Content-Type': 'application/json'};
    var request = Request(
        'POST',
        Uri.parse(
            'https://apptest.dokandemo.com/wp-json/wp/v2/users/register'));
    request.body = json.encode(body);
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      return response.statusCode.toString();
    } else {
      return null;
    }
  }
}
