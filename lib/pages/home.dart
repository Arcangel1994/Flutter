import 'package:flutter/material.dart';

import '../lenguajemanager.dart';
import './lenguaje_admin.dart';

class HomePage extends StatelessWidget {

  List<Map<String, dynamic>> _carpictures;
//  Function _addLenguaje;
//  Function _deleteLenguaje;

//  HomePage(this._carpictures, this._addLenguaje, this._deleteLenguaje);

  HomePage(this._carpictures);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Menu'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Gestión de lenguajes'),
              onTap: () {
                Navigator.pushNamed(context, '/admin');
                //Navigator.of(context).popAndPushNamed('/admin');
                //Navigator.popAndPushNamed(context, '/newroute');


//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => LenguajeAdminPage() ),
//                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Lenguajes'),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            splashColor: Colors.grey[400],
            onPressed: () {},
          ),

        ],
      ),
      body:
      LenguajeManager(_carpictures)
      //LenguajeManager(_carpictures, _addLenguaje, _deleteLenguaje),
    );
  }
}
