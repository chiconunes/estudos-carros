import 'dart:async';
import 'package:http/http.dart' as http;

class LorispumBloc {
  static String lorim; //-- variavel para cache
  final _streamController = StreamController<String>();
  Stream<String> get stream => _streamController.stream;
  fetch() async {
    String s = lorim ?? await LorispumApi.getLirpsum();
    lorim = s;
    _streamController.add(s);
  }

  void dispose() {
    _streamController.close();
  }
}

class LorispumApi {
  static Future<String> getLirpsum() async {
    var url = 'https://loripsum.net/api';
    print("Get > $url");
    var response = await http.get(url);
    String text = response.body;

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");
    return text;
  }
}
