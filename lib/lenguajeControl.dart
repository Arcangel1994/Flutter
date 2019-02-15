import 'package:flutter/material.dart';

class LenguajeControl extends StatelessWidget{

  //final Function addLenguaje;

  //LenguajeControl(this.addLenguaje);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      //color: Theme.of(context).primaryColor, Tomar el color del primary color
      color: Colors.redAccent[200],
      splashColor: Colors.red[900],
      textColor: Colors.white,
      onPressed: () {
        //addLenguaje({'title':'Flutter Dart', 'image': 'assets/out-flutter.jpg'});
      },
      child: Text('Añadir una foto'),
    );
  }

}