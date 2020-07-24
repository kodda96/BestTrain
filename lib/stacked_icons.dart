import 'package:flutter/material.dart';

class StackedIcons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.only(bottom: 40.0),
          height: 60.0,
          width: 60.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Color(0xFFFC6A7F)),
          child: new Icon(
            Icons.directions_transit,
            color: Colors.white,
          ),
        ),
        new Container(
          margin: new EdgeInsets.only(right: 50.0, top: 50.0),
          height: 60.0,
          width: 60.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Color(0xFF18D191)),
          child: new Icon(
            Icons.location_on,
            color: Colors.white,
          ),
        ),
        new Container(
          margin: new EdgeInsets.only(left: 50.0, top: 50.0),
          height: 60.0,
          width: 60.0,
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(50.0),
              color: Color(0xFFFFCE56)),
          child: new Icon(
            Icons.phone_iphone,
            color: Colors.white,
          ),
        )
      ],
    );

  }

}