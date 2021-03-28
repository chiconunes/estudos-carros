import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static favoritar(Carro c) async {
    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDao();
    final exists = await dao.exists(c.id);

    if (exists) {
      dao.delete(c.id);
    } else {
      dao.save(f);
    }
  }

  static List<Carro> getCarros() {
    List<Carro> carros = [];

    return carros;
  }
}
