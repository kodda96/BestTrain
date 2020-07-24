import 'package:flutter/material.dart';
import 'stacked_icons.dart';
import 'new_account.dart';
import 'stations_numbers.dart';
import 'webview.dart';
import 'lost_found.dart';

class LoginAsGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        backgroundColor: Colors.black12,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFF18D191)),
      ),
      body: Container(
          decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/images/trainimage.jpg'), fit: BoxFit.fill)),
          width: double.infinity,
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
                        style: new TextStyle(fontSize: 30.0, color: Colors.tealAccent, fontWeight: FontWeight.bold),
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
                                'Train Schedule',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              trailing:
                                  Icon(Icons.directions_subway, size: 40.0),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Webview()));
                              },
                            ),
                            elevation: 4.0,
                          ),
                          Card(
                            child: ListTile(
                              title: Text(
                                'Contact No. Of Railway Stations',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              trailing: Icon(Icons.phone_in_talk, size: 40.0),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Train()));
                              },
                            ),
                            elevation: 4.0,
                          ),
                          Card(
                            child: ListTile(
                                title: Text(
                                  'Contact Railway Security',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                trailing: Icon(Icons.security, size: 40.0),
                                onTap: () {
                                  _showDialog(context);
                                }),
                            elevation: 4.0,
                          ),
                          Card(
                            child: ListTile(
                                title: Text(
                                  'Lost and Found Items',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                trailing: Icon(Icons.announcement, size: 40.0),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LostAndFound()));
                                }),
                            elevation: 4.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: new Text(
                          "Create An Account",
                          style: new TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF18D191),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ])),
    );
  }

  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            "Special Notice!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                new Text('Only Use This number when'),
                new SizedBox(
                  height: 15.0,
                ),
                new Text('1. There is a disturbing moment'),
                new SizedBox(
                  height: 10.0,
                ),
                new Text('2. There is a misuse of railway'),
                new Text('     property'),
                new SizedBox(
                  height: 10.0,
                ),
                new Text('3. There is a Violent behavior'),
                new SizedBox(
                  height: 50.0,
                ),
                new SelectableText(
                  '071000111',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
