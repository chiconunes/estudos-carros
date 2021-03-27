import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/pages/carros/simple_bloc.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  Future<List<Carro>> fetch(String tipo) async {
    try {
      bool networkOn = await isNetworkOn();
      if (!networkOn) {
        List<Carro> carros = await CarroDAO().findAllByTipo(tipo);
        add(carros);
        return carros;
      } else {
        List<Carro> carros = await CarrosApi.getCarros(tipo);

        // Salva dados no sqlli
        if (carros.isNotEmpty) {
          final dao = CarroDAO();

          /* ou faz for assim  */
          // for (Carro c in carros) {
          //   dao.save(c);
          // }

          /* ou sintaxe resumida assim */
          // carros.forEach((c) => dao.save(c));

          /* ou sintaxe direta assim */
          carros.forEach(dao.save);
        }

        add(carros);
        return carros;
      }
    } on Exception catch (e) {
      addError(e);
    }
  }
}
