import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:carros/pages/carro/carro.dart';

class CarroPage extends StatelessWidget {
  Carro carro;
  CarroPage(this.carro);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopupMenu(value),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                ),
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Image.network(carro.urlFoto),
          _bloco1(),
          Divider(),
          _bloco2(),
        ],
      ),
    );
  }

  _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(carro.nome, fontSize: 20, bold: true),
            text(
              carro.tipo,
              fontSize: 16,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 40,
              ),
              onPressed: _onClickFavorite,
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            ),
          ],
        )
      ],
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("Editar !!");
        break;
      case "Deletar":
        print("Deletar !!");
        break;
      case "Share":
        print("Share !!");
        break;
    }
  }

  void _onClickFavorite() {}

  void _onClickShare() {}

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(carro.descricao, fontSize: 16, bold: true),
        SizedBox(
          height: 20,
        ),
        text(
            "Converters are often used with streams to transform the data that comes through the stream as it becomes available. The following code uses two converters. The first is a UTF-8 decoder, which converts the data from bytes to UTF-8 as it's read from a file, The second is an instance of LineSplitter, which splits the data on newline boundaries.Converters are often used with streams to transform the data that comes through the stream as it becomes available. The following code uses two converters. The first is a UTF-8 decoder, which converts the data from bytes to UTF-8 as it's read from a file, The second is an instance of LineSplitter, which splits the data on newline boundaries.Converters are often used with streams to transform the data that comes through the stream as it becomes available. The following code uses two converters. The first is a UTF-8 decoder, which converts the data from bytes to UTF-8 as it's read from a file, The second is an instance of LineSplitter, which splits the data on newline boundaries.Converters are often used with streams to transform the data that comes through the stream as it becomes available. The following code uses two converters. The first is a UTF-8 decoder, which converts the data from bytes to UTF-8 as it's read from a file, The second is an instance of LineSplitter, which splits the data on newline boundaries.Converters are often used with streams to transform the data that comes through the stream as it becomes available. The following code uses two converters. The first is a UTF-8 decoder, which converts the data from bytes to UTF-8 as it's read from a file, The second is an instance of LineSplitter, which splits the data on newline boundaries.",
            fontSize: 16),
      ],
    );
  }
}
