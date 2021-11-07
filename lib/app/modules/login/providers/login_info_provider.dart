import 'package:http/http.dart';

import '../login_info_model.dart';

class LoginInfoProvider{
  Future<dynamic> loginUser(String userName, String password) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = Request(
        'POST',
        Uri.parse(
            'https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token?username=$userName&password=$password'));

    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      print("got: $data");
      return loginInfoFromJson(data);
    } else {
      return response.reasonPhrase;
    }
  }
}
