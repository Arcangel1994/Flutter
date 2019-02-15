import 'package:flutter/material.dart';
import './pages/lenguaje.dart';

//Class de recyclar view
class Lenguaje extends StatelessWidget {
  final List<Map<String, dynamic>> carpictures;

  //final Function deleteLenguaje;

  Lenguaje(this.carpictures);

  //Lenguaje(this.carpictures, {this.deleteLenguaje});

  Widget _buildLenguajeItems(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(carpictures[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    carpictures[index]['title'],
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald'),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    '\$ ${carpictures[index]['salary'].toString()}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text('Flutter escrito principalmente en C++'),
          ),
          ButtonBar(
            //Aliniar button en centro
            //alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                color: Colors.teal[200],
                //splashColor: Theme.of(context).primaryColor,
                splashColor:  Colors.teal[900],
                icon: Icon(Icons.info),
//                child: Text('Detalles'),
                //push ir a la siguente pagina con una ruta , al agregar el then es una funcion the returno al regresar a esta pagina.
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/lenguaje/' + index.toString())
                        .then((bool value) {
                      if (value) {
                        //deleteLenguaje(index);
                      }
                    }),
//                    Navigator.push<bool>(
//                      context,
//                      MaterialPageRoute(
//                        builder: (BuildContext context) => LenguajePage(
//                            carpictures[index]['title'],
//                            carpictures[index]['image']),
//                      ),
//                    ).then((bool value) {
//
//                      if(value) {
//                        deleteLenguaje(index);
//                      }
//
//                    }),
              ),
              IconButton(
                color: Colors.red[300],
                splashColor: Colors.red,
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCarList() {
    Widget lenguajeCard;

    if (carpictures.length > 0) {
      lenguajeCard = ListView.builder(
        itemBuilder: _buildLenguajeItems,
        itemCount: carpictures.length,
      );
    } else {
      //sin mensaje
      // lenguajeCard = Container();

      lenguajeCard = Center(
        child: Text('Sin registro encuntrados'),
      );
    }

    return lenguajeCard;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return _buildCarList();

//    return carpictures.length > 0 ? ListView.builder(
//      itemBuilder: _buildLenguajeItems,
//      itemCount: carpictures.length,
//
////      children: carpictures
////          .map((element) => Card(
////                child: Column(
////                  children: <Widget>[
////                    Image.asset('assets/out-flutter.jpg'),
////                    Text(element)
////                  ],
////                ),
////              ))
////          .toList(),
//    ) : lenguajeCard ;
  }
}
