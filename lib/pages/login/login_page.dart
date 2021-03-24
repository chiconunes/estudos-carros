import 'dart:async';

import 'package:carros/pages/alert.dart';
import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/login_bloc.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/pages/carros/home_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tlogin = TextEditingController(text: "");

  final _tsenha = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  final _bloc = LoginBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(children: <Widget>[
          AppTextNew(
            "Login...",
            "Digite seu Login",
            controler: _tlogin,
            validator: _validateLogin,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            focusNext: _focusSenha,
          ),
          SizedBox(
            height: 10,
          ),
          AppTextNew(
            "Senha...",
            "Digite sua Senha",
            password: true,
            controler: _tsenha,
            validator: _validateSenha,
            keyboardType: TextInputType.number,
            focusNode: _focusSenha,
          ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder<bool>(
              stream: _bloc.buttomBloc.stream,
              initialData: false, // seta dados iniciando com false
              builder: (context, snapshot) {
                return AppButton(
                  "Login",
                  onPressed: _onClickLogin,
                  showProgress: snapshot.data ?? false,
                );
              }),
        ]),
      ),
    );
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String _login = _tlogin.text;
    String _senha = _tsenha.text;
    print("Login :$_login, Senha:$_senha");

    ApiResponse response = await _bloc.login(_login, _senha);

    if (response.ok) {
      Usuario user = response.result;

      print(">>> $user");
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
      print("else do login page");
    }
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A Senha precisa ter pelo menos 3 numeros";
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}
