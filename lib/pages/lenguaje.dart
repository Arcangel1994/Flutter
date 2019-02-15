import 'package:flutter/material.dart';

class LenguajePage extends StatelessWidget {
  final String title;
  final String imgUrl;

  LenguajePage(this.title, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        print('Presione Regresar');
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          //Aliniar al centro Verticalmente
          //mainAxisAlignment: MainAxisAlignment.center,
          //Aliniar al centro Horizontalmente
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Image.network(imgUrl),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(7.0),
                  child: Text(title),
                ),
                RaisedButton(
                  child: Text('Atras'),
                  color: Colors.teal[400],
                  splashColor: Colors.teal[900],
                  textColor: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
                RaisedButton(
                  child: Text('Eliminar'),
                  color: Colors.redAccent[200],
                  splashColor: Colors.red[900],
                  textColor: Colors.white,
                  onPressed: () => Navigator.pop(context, true),
                ),
                RaisedButton(
                  child: Text('ShowDialog'),
                  color: Colors.blueAccent[200],
                  splashColor: Colors.blue[900],
                  textColor: Colors.white,
                  onPressed: () {
                    _showAlertDialogDelete(context);
                  },
                )

            ],),
          ],
        ),
      ),
    );
  }

  void _showAlertDialogDelete(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {},
         child: AlertDialog(
          title: Text('Estas seguro?'),
          content: Text('Esta acción no se puede deshacer.'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            ),
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),);
      },
    );
  }
}
