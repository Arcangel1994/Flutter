import 'package:flutter/material.dart';
//import './lenguajemanager.dart';

//import './pages/home.dart';
import './pages/auth.dart';
import './pages/home.dart';
import './pages/lenguaje_admin.dart';

import 'package:flutter/rendering.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//Page de detalles
import './pages/lenguaje.dart';

void main(){
  //debugPaintSizeEnabled=true;
  runApp(MyFirstApp());
}

class MyFirstApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyFirstAppState();
  }

}

class _MyFirstAppState extends State<MyFirstApp>{

  List<Map<String, dynamic>> _carpictures = [];

  @override
  void initState() {
    // TODO: implement initState

    http
        .get('https://flutter-test-a747e.firebaseio.com/lenguajes.json')
        .then((http.Response response) {
      final Map<String, dynamic> lenguajesList = json.decode(response.body);

      lenguajesList.forEach((String key, dynamic value) {
        print('$key ${value['title']}');
        _carpictures.add({'title':'${value['title']}', 'image': '${value['image']}', 'salary': '${value['salary']}'});
      });

      print(json.decode(response.body));
    });

    super.initState();
  }

  void _addLenguaje(Map<String, dynamic> lenguaje){
    setState(() {
      _carpictures.add(lenguaje);
    });
  }

  void _deleteLenguaje(int index){

    setState((){
      _carpictures.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.teal, brightness: Brightness.light),
      home: AuthPage(),
      routes: {
        //'/': (BuildContext context) => AuthPage(),
        '/home': (BuildContext context) => HomePage(_carpictures),
        '/admin': (BuildContext context) => LenguajeAdminPage(_addLenguaje, _deleteLenguaje),
      },
      onGenerateRoute: (RouteSettings settings) {
        //'','Fluter Dart','1'
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'lenguaje') {
          final int index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => LenguajePage(_carpictures[index]['title'], _carpictures[index]['image']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (BuildContext context) => HomePage(_carpictures));
      }
      ,
    );
  }
}

//StatefulWidget es la creacion de un clase lister donde escucha los cambios de las variables aderidas a un objetos y actualizarlas
//Esta extencion ocupa de una clase hijo donde se desarrollo los objetos para poder usar setState el inicio de la case debe de empizar con _
//class MyFirstApp extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _MyFirstApp();
//  }
//}
//
//class _MyFirstApp extends State<MyFirstApp> {
//  List<String> _carpictures = ['Flutter'];
//
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Lenguajes'),
//          ),
//          body: Column(
//            children: [
//              Container(
//                margin: EdgeInsets.all(8.0),
//                child: RaisedButton(
//                  onPressed: () {
//
//                    setState(() {
//                      _carpictures.add("Android");
//                    });
//
//                  },
//                  child: Text('Añadir una foto'),
//                ),
//              ),
//              Column(
//                children: _carpictures
//                    .map((element) => Card(
//                          child: Column(
//                            children: <Widget>[
//                              Image.asset('assets/out-flutter.jpg'),
//                              Text(element)
//                            ],
//                          ),
//                        ))
//                    .toList(),
//              ),
//            ],
//          )),
//    );
//  }
//}

//StatelessWidget Es la creacion de un Activiy no dinamico de cambio de valores de objectos o widget
//class MyFirstApp extends StatelessWidget {
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Lenguajes'),
//          ),
//          body: Column(
//            children: [
//              Container(
//                margin: EdgeInsets.all(8.0),
//                child: RaisedButton(
//                  onPressed: () {},
//                  child: Text('Añadir una foto'),
//                ),
//              ),
//              Card(
//                child: Column(
//                  children: <Widget>[
//                    Image.asset('assets/out-flutter.jpg'),
//                    Text('Flutter')
//                  ],
//                ),
//              ),
//            ],
//          )),
//    );
//  }
//}
