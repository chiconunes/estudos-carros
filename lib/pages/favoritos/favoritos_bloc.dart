import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/simple_bloc.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch() async {
    try {
      List<Carro> carros = await FavoritoService.getCarros();

      add(carros);
      return carros;
    } on Exception catch (e) {
      addError(e);
    }
  }
}
