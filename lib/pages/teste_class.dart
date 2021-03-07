import 'dart:convert';

class Teste {
  String eu;
  String tu;
  Teste({
    this.eu,
    this.tu,
  });

  Map<String, dynamic> toMap() {
    return {
      'eu': eu,
      'tu': tu,
    };
  }

  factory Teste.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Teste(
      eu: map['eu'],
      tu: map['tu'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Teste.fromJson(String source) => Teste.fromMap(json.decode(source));
}
