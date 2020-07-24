import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WebviewState();
  }
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Train Schedule'),
      ),
      body: Builder(
        builder: (BuildContext context){
          return WebView(
            initialUrl: 'http://slr.malindaprasad.com/',
            javascriptMode: JavascriptMode.unrestricted,
          );
        },
      ),
    );
  }
}
