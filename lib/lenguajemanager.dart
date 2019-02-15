import 'package:flutter/material.dart';
import './lenguaje.dart';
import './lenguajeControl.dart';

//StatefulWidget es la creacion de un clase lister donde escucha los cambios de las variables aderidas a un objetos y actualizarlas
//Esta extencion ocupa de una clase hijo donde se desarrollo los objetos para poder usar setState el inicio de la case debe de empizar con _

//Clase de Add Lenguaje
class LenguajeManager extends StatelessWidget {

  List<Map<String, dynamic>> _carpictures;
//  Function addLenguaje;
//  Function deleteLenguaje;

//  LenguajeManager(this._carpictures, this.addLenguaje, this.deleteLenguaje);
  LenguajeManager(this._carpictures);

//  Map<String,String> startLenguaje;
//
//  //Dar un valor de default
//  //LenguajeManager({this.startLenguaje = 'Dart Flutter'});
//
//  LenguajeManager({this.startLenguaje});
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _LenguajeManagerState();
//  }
//}
//
//class _LenguajeManagerState extends State<LenguajeManager> {
//
//  List<Map<String,String>> _carpictures = [];
//
//  @override
//  void initState() {
//    // TODO: implement initState
//
//    if(widget.startLenguaje != null) {
//      _carpictures.add(widget.startLenguaje);
//    }
//
//    super.initState();
//
//  }
//
//  @override
//  void didUpdateWidget(LenguajeManager oldWidget) {
//    // TODO: implement didUpdateWidget
//    super.didUpdateWidget(oldWidget);
//  }
//
////  void _addLenguaje(Map<String, String> lenguaje){
////    setState(() {
////      _carpictures.add(lenguaje);
////    });
////  }
////
////  void _deleteLenguaje(int index){
////
////    setState((){
////        _carpictures.removeAt(index);
////    });
////
////  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
//        Container(
//          margin: EdgeInsets.all(8.0),
//          child:
//          LenguajeControl()
//          //LenguajeControl(addLenguaje),
//        ),

        Expanded(child: Lenguaje(_carpictures) )
        //Lenguaje()

      ],
    );
  }
}
