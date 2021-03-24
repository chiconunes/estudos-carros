import 'dart:convert' as convert;

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };
    print(headers);
    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';
    print("GET >>> $url");
    print("> $headers");

    var response = await http.get(url, headers: headers);
    print("GET > $url");
    String json = response.body;

    print(json);
    List list = convert.json.decode(json);
    final carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

    final dao = CarroDAO();

    /* ou faz for assim  */
    // for (Carro c in carros) {
    //   dao.save(c);
    // }

    /* ou sintaxe resumida assim */
    // carros.forEach((c) => dao.save(c));

    /* ou sintaxe direta assim */
    carros.forEach(dao.save);
    return carros;
  }
}
