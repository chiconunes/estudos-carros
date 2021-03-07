import 'dart:async';

import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';

class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  List<Carro> carros;
  final _streamController = StreamController<List<Carro>>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadCarros();
  }

  _loadCarros() async {
    List<Carro> carros = await CarrosApi.getCarros(widget.tipo);
    _streamController.add(carros);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Nao foi possivel buscar os carros",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;

        return _listView(carros);
      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: carros.length,
        itemBuilder: (BuildContext context, int index) {
          Carro c = carros[index];
          return Card(
            color: Colors.grey[100],
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.network(
                      c.urlFoto,
                      width: 250,
                    ),
                  ),
                  Text(
                    c.nome,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Descri��o",
                    style: TextStyle(fontSize: 16),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarTheme.of(context),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text("DETALHES"),
                          onPressed: () => _onClickCarro(c),
                        ),
                        FlatButton(
                          child: const Text("SHARE"),
                          onPressed: () {
                            /* .... */
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _onClickCarro(Carro c) {
    push(context, CarroPage(c));
  }
}