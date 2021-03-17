import 'package:carros/pages/carros/carros_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_bloc.dart';

import 'package:carros/widgets/text_error.dart';

class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  List<Carro> carros;

  final _bloc = CarrosBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.fetch(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Nao foi possivel carregar os dados.");
        }

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Carro> carros = snapshot.data;

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(carros),
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(widget.tipo);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }
}