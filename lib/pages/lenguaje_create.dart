import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'image.dart';

class LenguajeCreatePage extends StatefulWidget {
  Function addLenguaje;

  LenguajeCreatePage(this.addLenguaje);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LenguajeCreatePageState();
  }
}

class _LenguajeCreatePageState extends State<LenguajeCreatePage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'salary': null,
    'image':
        'https://swapps.com/wp-content/uploads/2018/07/trying-out-flutter.jpg',
//    'image': 'assets/out-flutter.jpg',
  };

//  String _titleValue;
//  String _descriptionValue;
//  int _salaryValue;
  bool _accept = false;

  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();

  Future<bool> _submitForm() async {
    if (!_keyform.currentState.validate()) return false;

    _keyform.currentState.save();
//    final Map<String, dynamic> lenguaje = {
//      'title': _titleValue,
//      'description': _descriptionValue,
//      'salary': _salaryValue,
//      'image': 'assets/out-flutter.jpg',
//    };

    //widget.addLenguaje(_formData);

    //Put Actualizar
//    final String dKey = '-LYcVKGazaeWDpUJzYFz';
//    http
//        .put('https://flutter-test-a747e.firebaseio.com/lenguajes/$dKey.json',
//    body: json.encode(_formData))
//        .then((http.Response response) {
//      print('Trayendo datos');
//      fetchCars();
//    });

    //Delete
//    http
//        .delete('https://flutter-test-a747e.firebaseio.com/lenguajes/$dKey.json')
//        .then((http.Response response) {
//      print('Trayendo datos');
//      fetchCars();
//    });

    //Insert
    try {
      await http
          .post('https://flutter-test-a747e.firebaseio.com/lenguajes.json',
              body: json.encode(_formData))
          .then((http.Response response) {
        if (response.statusCode != 200 || response.statusCode != 201) return false;

        final Map<String, dynamic> respondeData = json.decode(response.body);
        print(respondeData);
        print("Otra cosa");
        print(response);
        print('Trayendo datos');
        //fetchCars();
        return true;
      });
      return true;
    } catch (e) {
      return false;
    }
    //Navigator.pushReplacementNamed(context, '/home');
    //Navigator.of(context).pushReplacementNamed('/home');
  }

  void fetchCars() {
    http
        .get('https://flutter-test-a747e.firebaseio.com/lenguajes.json')
        .then((http.Response response) {
      final Map<String, dynamic> lenguajesList = json.decode(response.body);

      lenguajesList.forEach((String key, dynamic value) {
        print('$key ${value['title']}');
      });

      print(json.decode(response.body));
    });
  }

  Widget _buildTitleTextField() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'Lenguaje Title'),
        //autovalidate: true,
        validator: (String value) {
          if (value.isEmpty || value.trim().length == 0) {
            return 'Vacio';
          } else if (value.length < 3) {
            return 'Mayor a 5 caracteres';
          }
        },
        onSaved: (String value) {
          print('Titulo revisando $value');
          setState(() {
            _formData['title'] = value;
          });
        });
    //TextField un EditText no ligado a un formulario y necesario a cambiar su valor
//    return TextField(
//      decoration: InputDecoration(labelText: 'Lenguaje Title'),
//      onChanged: (String value) {
//        setState(() {
//          _titleValue = value;
//        });
//      },
//    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
        maxLines: 2,
        decoration: InputDecoration(labelText: 'Lenguaje Description'),
        validator: (String value) {
          if (value.isEmpty || value.trim().length == 0) {
            return 'Vacio';
          } else if (value.length < 10) {
            return 'Mayor a 20 caracteres';
          }
        },
        onSaved: (String value) {
          print('Descripcion revisando $value');
          setState(() {
            _formData['description'] = value;
          });
        }
//      onChanged: (String value) {
//        setState(() {
//          _descriptionValue = value;
//        });
//      },
        );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: 'Lenguaje Salary'),
      validator: (String value) {
        if (value.isEmpty || value.trim().length == 0) {
          return 'Vacio';
        } else if (!RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Solo Numeros';
        }
      },
      onSaved: (String value) {
        print('Price revisando $value');
        setState(() {
          _formData['salary'] = int.parse(value);
        });
      },
//      onChanged: (String value) {
//        setState(() {
//          _salaryValue = int.parse(value);
//        });
//      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _keyform,
        child: ListView(
          children: <Widget>[
            _buildTitleTextField(),
//          SwitchListTile(
//            value: _accept,
//            onChanged: (bool value) {
//              setState(() {
//                _accept = value;
//              });
//            },
//            title: Text('aceptación'),
//          ),
            _buildDescriptionTextField(),
            _buildPriceTextField(),
            //Margin top de 10dp
            SizedBox(
              height: 10.0,
            ),
            ImageInput(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Guardar'),
              color: Colors.teal[400],
              splashColor: Colors.teal[900],
              textColor: Colors.white,
              onPressed: (() {

                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    });

                _submitForm().then((bool success) {
                  if (!success) {
                    Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Hay algo mal'),
                            content: Text('Por favor intente de nuevo'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  }else{
                    Navigator.of(context).pop();
                  }
                });
              }),
            ),
            //Funcion de click en un objeto
//          GestureDetector(
//            onTap: _submitForm,
//            child: Container(
//              color: Colors.blueAccent,
//              padding: EdgeInsets.all(3.0),
//              child: Text('Guardar'),
//            ),
//          ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  void funshowBottonSheet() {
    Container(
      child: Center(
        child: RaisedButton(
          child: Text('Ventana modelo'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: Text('Esta ventana es una ventana modelo.'),
                  );
                });
          },
        ),
      ),
    );
  }
}
