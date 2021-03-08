import 'dart:async';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/usuario.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  Stream<bool> get buttonStream => _streamController.stream;

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.sink.add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    _streamController.sink.add(false);

    return response;
  }

  void dispose() {
    _streamController.close();
  }
}
