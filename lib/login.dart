import 'package:flutter/material.dart';
import 'stacked_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'registered_user.dart';
import 'reset_password.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _error;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        print('Signed in: ${user.uid}');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegisteredUser(),
            ));
      } catch (e) {
        setState(() {
          _error = e.message;
        });
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0xFF18D191)),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: new Form(
              key: formKey,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    showAlert(),
                    new StackedIcons(),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 80.0),
                          child: new Text(
                            "BestTrain",
                            style: new TextStyle(fontSize: 30.0),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0.0),
                      child: new TextFormField(
                        decoration: new InputDecoration(
                            labelText: "Email",
                            labelStyle: new TextStyle(fontSize: 20.0),
                            errorStyle: TextStyle(fontSize: 15.0)),
                        validator: (value) =>
                            value.isEmpty ? 'Email can\'t be empty' : null,
                        onSaved: (value) => _email = value,
                      ),
                    ),
                    new SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0.0),
                      child: new TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(
                            labelText: "Password",
                            labelStyle: new TextStyle(fontSize: 20.0),
                            errorStyle: TextStyle(fontSize: 15.0)),
                        validator: (value) =>
                            value.isEmpty ? 'Password can\'t be empty' : null,
                        onSaved: (value) => _password = value,
                      ),
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 5.0, top: 30.0),
                                child: new Container(
                                    alignment: Alignment.center,
                                    height: 60.0,
                                    decoration: new BoxDecoration(
                                        color: Color(0xFF18D191),
                                        borderRadius:
                                            new BorderRadius.circular(9.0)),
                                    child: GestureDetector(
                                      onTap: () {
                                        validateAndSubmit();
                                      },
                                      child: new Text("Login",
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white)),
                                    ))),
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 5.0, top: 30.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => ResetPassword()));
                                  },
                                  child: new Container(
                                      alignment: Alignment.center,
                                      height: 60.0,
                                      child: new Text("Forgot Password",
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFF18D191)))),
                                )),
                          )
                        ]),
                  ]),
            )),
      ),
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
              ),
            ),
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                }),
          ],
        ),
      );
    }
    return SizedBox(
      height: 0.0,
    );
  }
}