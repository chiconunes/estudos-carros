import 'package:carros/utils/sql/entity.dart';

class Carro extends Entity {
  int id;
  String nome;
  String tipo;
  String descricao;
  String urlFoto;
  String urlVideo;
  String latitude;
  String longitude;

  Carro(
      {this.id,
      this.nome,
      this.tipo,
      this.descricao,
      this.urlFoto,
      this.urlVideo,
      this.latitude,
      this.longitude});

  Carro.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    descricao = json['descricao'];
    urlFoto = json['urlFoto'];
    urlVideo = json['urlVideo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['descricao'] = this.descricao;
    data['urlFoto'] = this.urlFoto ??
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tudocelular.com%2Fcuriosidade%2Fnoticias%2Fn172335%2Fgoogle-corrige-falha-android-apps.html&psig=AOvVaw3dzW0DYWFSgDtabeHHlxWV&ust=1616718213330000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPjuo6SXyu8CFQAAAAAdAAAAABAJ";
    data['urlVideo'] = this.urlVideo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
