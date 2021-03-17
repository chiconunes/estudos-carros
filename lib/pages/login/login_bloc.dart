import 'dart:async';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/pages/carros/simple_bloc.dart';

class LoginBloc {
  final buttomBloc = BooleanBloc();

  Future<ApiResponse<Usuario>> login(String login, String senha) async {
    buttomBloc.add(true);
    ApiResponse response = await LoginApi.login(login, senha);
    buttomBloc.add(false);

    return response;
  }

  void dispose() {
    buttomBloc.dispose();
  }
}
