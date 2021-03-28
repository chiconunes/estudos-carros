import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carro_dao.dart';
import 'package:carros/pages/favoritos/favorito.dart';
import 'package:carros/pages/favoritos/favorito_dao.dart';

class FavoritoService {
  static Future favoritar(Carro c) async {
    Favorito f = Favorito.fromCarro(c);

    final dao = FavoritoDao();
    final exists = await dao.exists(c.id);

    if (exists) {
      dao.delete(c.id);
      return false;
    } else {
      dao.save(f);
      return true;
    }
  }

  static Future<List<Carro>> getCarros() async {
    List<Carro> carros = await CarroDAO().query(
        "select c.* from carro c, favorito f where c.id = f.id and c.urlFoto is not null");

    return carros;
  }

  static Future<bool> isFavorite(Carro c) async {
    final dao = FavoritoDao();
    final exists = await dao.exists(c.id);

    return exists;
  }
}
