import 'package:carros/pages/carros/carro.dart';
import 'package:carros/utils/sql/base_dao.dart';

// Data Access Object
class CarroDAO extends BaseDAO<Carro> {
  @override
  String get tableName => "carro";

  @override
  Carro fromMap(Map<String, dynamic> map) {
    Carro.fromMap(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo) async {
    final dbClient = await db;

    final list = await dbClient.rawQuery(
        'select * from carro where tipo =? and urlFoto is not null', [tipo]);
    final carros = list.map<Carro>((json) => Carro.fromMap(json)).toList();
    print("findAllByTipo carros $carros");
    return carros;
  }
}
