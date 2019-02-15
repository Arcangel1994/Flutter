import 'package:flutter/material.dart';

import './home.dart';

import 'lenguaje_create.dart';
import 'lenguaje_list.dart';
import 'lenguajefab.dart';

class LenguajeAdminPage extends StatelessWidget {

  Function _addLenguaje;
  Function _deleteLenguaje;

  LenguajeAdminPage(this._addLenguaje, this._deleteLenguaje);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Menu'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  //Navigator.pushReplacementNamed(context, '/home');
                  //Navigator.of(context).pushReplacementNamed('/home');
                  //Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/home');
//                  Navigator.pushReplacement(
//                    context,
//                    MaterialPageRoute(
//                        builder: (BuildContext context) => HomePage()),
//                  );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Gestión de lenguajes'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Crear',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'Lista',
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[LenguajeCreatePage(_addLenguaje), LenguajeListPage()],
        ),
        floatingActionButton:  LenguajeFab(),
      ),
    );
  }
}
