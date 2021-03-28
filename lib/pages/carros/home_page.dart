import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/pages/carros/carros_pages.dart';
import 'package:carros/pages/favoritos/favoritos_page.dart';
import 'package:carros/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:carros/widgets/drawer_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTabs();
  }

  _initTabs() async {
    int tabIdx = await Prefs.getInt("tabIdx");

    _tabController = TabController(length: 4, vsync: this);

    setState(() {
      _tabController.index = tabIdx;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        bottom: _tabController == null
            ? null
            : TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: "Cl�ssicos",
                    icon: Icon(Icons.directions_car),
                  ),
                  Tab(
                    text: "Esportivos",
                    icon: Icon(Icons.directions_car),
                  ),
                  Tab(
                    text: "Luxo",
                    icon: Icon(Icons.directions_car),
                  ),
                  Tab(
                    text: "Favoritos",
                    icon: Icon(Icons.favorite),
                  )
                ],
              ),
      ),
      body: _tabController == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TabBarView(
              controller: _tabController,
              children: [
                CarrosPage(TipoCarro.classicos),
                CarrosPage(TipoCarro.esportivos),
                CarrosPage(TipoCarro.luxo),
                FavoritosPage(),
              ],
            ),
      drawer: DrawerList(),
    );
  }
}
