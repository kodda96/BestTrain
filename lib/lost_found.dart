import 'package:flutter/material.dart';
import 'stacked_icons.dart';
import 'lostitems.dart';
import 'founditems.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class LostAndFound extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LostAndFoundState();
  }
}

class AddLostItems {
  Future<void> addData(itemData) async {
    Firestore.instance.collection('lost_items').add(itemData);
  }
}

class AddFoundItems {
  Future<void> addData(itemData) async {
    Firestore.instance.collection('found_items').add(itemData);
  }
}

class _LostAndFoundState extends State<LostAndFound> {
  String lostItemName;
  String lostItemDetails;
  String foundItemName;
  String foundItemDetails;

  AddLostItems lostObj = new AddLostItems();
  AddFoundItems foundObj = new AddFoundItems();

  Future<bool> lostItemDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Details',
                style: TextStyle(fontWeight: FontWeight.bold)),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Enter Lost Item Name'),
                  onChanged: (value) {
                    this.lostItemName = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter Lost Item details'),
                  onChanged: (value) {
                    this.lostItemDetails = value;
                  },
                ),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                  lostObj.addData({
                    'name': this.lostItemName,
                    'details': this.lostItemDetails
                  }).then((result) {
                    dialogTrigger(context);
                  });
                },
              ),
            ],
          );
        });
  }

  Future<bool> foundItemDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add Details',
                style: TextStyle(fontWeight: FontWeight.bold)),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter Found Item Name'),
                  onChanged: (value) {
                    this.foundItemName = value;
                  },
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Enter Found Item details'),
                  onChanged: (value) {
                    this.foundItemDetails = value;
                  },
                ),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                  foundObj.addData({
                    'name': this.foundItemName,
                    'details': this.foundItemDetails
                  }).then((result) {
                    dialogTrigger(context);
                  });
                },
              ),
            ],
          );
        });
  }

  Future<bool> dialogTrigger(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Done',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  new SizedBox(
                    height: 30.0,
                  ),
                  new Text('Your response is submitted'),
                ],
              ),
            ),
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
  }

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
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/images/light.jpg'),
                fit: BoxFit.fill)),
        width: double.infinity,
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new StackedIcons(), // imported function to display the app logo
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 50.0),
                    child: new Text(
                      "BestTrain",
                      style: new TextStyle(fontSize: 30.0),
                    ),
                  )
                ],
              ),
              Expanded(
                child: new ListView(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        Card(
                          child: ListTile(
                            title: Text(
                              'Lost Items',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LostItems()));
                            },
                          ),
                          elevation: 4.0,
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              'Found Items',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoundItems()));
                            },
                          ),
                          elevation: 4.0,
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              'Submit Lost Items',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onTap: () {
                              lostItemDialog(context);
                            },
                          ),
                          elevation: 4.0,
                        ),
                        Card(
                          child: ListTile(
                            title: Text(
                              'Submit Found Items',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onTap: () {
                              foundItemDialog(context);
                            },
                          ),
                          elevation: 4.0,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
