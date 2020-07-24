import 'package:flutter/material.dart';
import 'stacked_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class TrackLocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TrackLocationState();
  }
}

class TrainData {
  final int userId;
  final int id;
  final String body;

  TrainData(this.userId, this.id, this.body);
}

class _TrackLocationState extends State<TrackLocation> {
  Future<List<TrainData>> _getData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/posts");
    var jsonData = jsonDecode(response.body);
    List<TrainData> trains = [];
    for (var i in jsonData) {
      TrainData train = TrainData(i["userId"], i["id"], i["body"]);
      trains.add(train);
    }
    return trains;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFF18D191)),
      ),
      body: Container(
          decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/images/light.jpg'), fit: BoxFit.fill)),
          width: double.infinity,
          child: FutureBuilder(
            future: _getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              } else {
                return Container(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: <Widget>[
                          new StackedIcons(),
                          // imported function to display the app logo
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 50.0),
                                child: new Text(
                                  "BestTrain",
                                  style: new TextStyle(fontSize: 30.0),
                                ),
                              )
                            ],
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30.0,
                                ),
                                child: Expanded(
                                  child: new Text(
                                    'Last Passed   \nStation',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              new SizedBox(
                                width: 50.0,
                              ),
                              Expanded(
                                child: new Text(
                                  //snapshot.data[1].body,
                                  'Matara Railway Station', //dummy data
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
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
                                child: Expanded(
                                  child: new Text(
                                    'Time to Arrive',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              new SizedBox(
                                width: 50.0,
                              ),
                              Expanded(
                                child: new Text(
                                  //snapshot.data[1].body,
                                  '00:45:20',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
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
                                child: Expanded(
                                  child: new Text(
                                    'Time to \nDestination',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              new SizedBox(
                                width: 50.0,
                              ),
                              Expanded(
                              child: new Text(
                                //snapshot.data[1].body,
                                '03:37:23', // dummy data
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            },
          )),
    );
  }
}
