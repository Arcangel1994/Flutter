import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File _imageFile;

  void _getImage(BuildContext context, ImageSource source){

    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image){

      setState(() {
        _imageFile = image;
      });
      Navigator.of(context).pop();

    });

  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 180.0,
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Imagen',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  child: Text('Camara'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  },
                ),
                FlatButton(
                  child: Text('Galeria'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        OutlineButton(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          onPressed: () {
            _openImagePicker(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                'Añadir una foto',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        _imageFile == null
            ? Text('Por favor seleccione la imagen')
            : Image.file(
                _imageFile,
                fit: BoxFit.cover,
                height: 300,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
              )
      ],
    );
  }
}
