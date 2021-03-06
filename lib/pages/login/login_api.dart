import 'dart:convert';

import 'package:carros/utils/prefs.dart';
import 'package:http/http.dart' as http;

import '../api_response.dart';
import 'package:carros/pages/login/usuario.dart';

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {"username": login, "password": senha};

      String s = json.encode(params);

      print("> $s");
      print("url >>> $url");
      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        user.save();

        Usuario user2 = await Usuario.get();
        print("User2 $user2");
        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch (erro, exception) {
      print("erro no login >>> $exception");

      return ApiResponse.error("Nao foi possivel fazer o login");
    }
  }
}
