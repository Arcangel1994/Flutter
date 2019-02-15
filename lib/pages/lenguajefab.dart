import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LenguajeFab extends StatefulWidget {
  bool isFavorite = false;
  String email = 'test@test.com';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LenguajeFabState();
  }
}

class _LenguajeFabState extends State<LenguajeFab>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 70.0,
          width: 50.0,
          alignment: FractionalOffset.bottomCenter,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _animationController,
              curve: Interval(0.0, 1.0, curve: Curves.easeOut),
            ),
            child: FloatingActionButton(
              heroTag: 'mail',
              mini: true,
              child: Icon(
                Icons.mail,
              ),
              backgroundColor: Colors.teal[300],
              onPressed: () async {
                final url = 'mailto:${widget.email}';
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
          ),
        ),
        Container(
          height: 72.0,
          width: 52.0,
          child: ScaleTransition(
            scale: CurvedAnimation(
              parent: _animationController,
              curve: Interval(0.0, 1.0, curve: Curves.easeOut),
            ),
            child: FloatingActionButton(
              mini: true,
              heroTag: 'favorite',
              child: Icon(
                widget.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              backgroundColor: Colors.teal[400],
              onPressed: () {
                setState(() {
                  if (widget.isFavorite) {
                    widget.isFavorite = false;
                  } else {
                    widget.isFavorite = true;
                  }
                });
              },
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: 'options',
          child: Icon(Icons.more_vert),
          backgroundColor: Colors.teal[600],
          onPressed: () {
            if (_animationController.isDismissed) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          },
        ),
      ],
    );
  }
}
