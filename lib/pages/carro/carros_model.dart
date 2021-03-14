import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:mobx/mobx.dart';

part 'carros_model.g.dart';

// This is the class used by rest of your codebase
class CarrosModel = CarrosModelBase with _$CarrosModel;

// The store-class
abstract class CarrosModelBase with Store {
  @observable
  List<Carro> carros;
  @observable
  Exception error;
  @action
  fetch(String tipo) async {
    try {
      this.carros = await CarrosApi.getCarros(tipo);
    } on Exception catch (e) {
      error = e;
    }
  }
}
