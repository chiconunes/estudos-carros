import 'dart:async';

import 'package:carros/pages/carros/home_page.dart';
import 'package:carros/pages/favoritos/db_helper.dart';
import 'package:carros/pages/login/login_page.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 15), () {
      push(context, LoginPage());
    });

    //incia o bd
    Future futureA = DatabaseHelper.getInstance().db;
    Future futureB = Future.delayed(Duration(seconds: 3));

    Future<Usuario> futureC = Usuario.get();

    // Aguardo os 2 futures
    Future.wait([futureA, futureB, futureC]).then((List values) {
      Usuario user = values[2];
      print(user);

      if (user != null) {
        push(context, HomePage(), replace: true);
      } else {
        // Chama tela de login
        push(context, LoginPage(), replace: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
