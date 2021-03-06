import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'stacked_icons.dart';
import 'best_route.dart';

class FindTrain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindTrainState();
  }
}

class _FindTrainState extends State<FindTrain> {
  var _stations = [
    'AHANGAMA',
    'COLOMBO FORT',
    'GALLE',
    'MATARA',


  ];
  String startstation = 'MATARA';
  String endstation = 'COLOMBO FORT';
  String start;
  String end;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFF18D191)),
      ),
      body: Container(
        width: double.infinity,
        child: Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new StackedIcons(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                    child: new Text(
                      "BestTrain",
                      style: new TextStyle(fontSize: 30.0),
                    ),
                  )
                ],
              ),
              new SizedBox(
                height: 20.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: new Text(
                      'Start Station',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 40.0,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: _stations.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: new Container(
                            child: Text(
                              dropDownStringItem,
                              style: TextStyle(color: Colors.black),
                            ),
                            width: 130.0,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.startstation = newValueSelected;
                        });
                      },
                      elevation: 16,
                      value: startstation,
                    ),
                  )
                ],
              ),
              new SizedBox(
                height: 20.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: new Text(
                      'Destination',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  new SizedBox(
                    width: 50.0,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: _stations.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: new Container(
                            child: Text(
                              dropDownStringItem,
                              style: TextStyle(color: Colors.black),
                            ),
                            width: 130.0,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String newValueSelected) {
                        setState(() {
                          this.endstation = newValueSelected;
                        });
                      },
                      elevation: 16,
                      value: endstation,
                    ),
                  )
                ],
              ),
              new SizedBox(
                height: 50.0,
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        getDropDownItem();
                        //_createPost();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BestRoute()));
                      },
                      child: new Container(
                        margin: EdgeInsets.only(
                            right: 30.0, left: 30.0, bottom: 100.0 ),
                        alignment: Alignment.center,
                        height: 70.0,
                        width: 150.0,
                        decoration: new BoxDecoration(
                            color: Color(0xFF18D191),
                            borderRadius: new BorderRadius.circular(10.0)),
                        child: new Text("Find Best Route",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void getDropDownItem(){
    setState(() {
      start = startstation;
      end = endstation;
    });
  }
  void _createPost() async {
    final response = await http.post(
      'https://jsonplaceholder.typicode.com/posts', // enter server url
      body: jsonEncode(
        {
          'start': start,
          'end': end,
        },
      ),
      headers: {'Content-Type': "application/json"},
    );
  }
}
