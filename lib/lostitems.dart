import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LostItems extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LostItemsState();
  }
}

class _LostItemsState extends State<LostItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Lost Items'),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('lost_items').orderBy('name').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('Loading data... Please wait');
            return Container(
              decoration: new BoxDecoration(image: new DecorationImage(image: AssetImage('assets/images/light.jpg'), fit: BoxFit.fill)),
              child: ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  padding: const EdgeInsets.only(top: 30.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          snapshot.data.documents[index]['name'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                        subtitle: Text(
                          snapshot.data.documents[index]['details'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      elevation: 4.0,
                    );
                  }),
            );
          },
        ));
  }
}
