import 'package:flutter/material.dart';
import 'package:login/login.dart';

void main() {
  runApp(LoginPage());
}

class UyeOl extends StatefulWidget {
  @override
  _UyeBilgisi createState() => _UyeBilgisi();
}

class _UyeBilgisi extends State<UyeOl> {
  String email;
  String userName;
  String password1;
  String password2;

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Form(
                key: _formState,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "E-mail",
                              labelStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              email = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Kullanıcı Adı",
                              labelStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              userName = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Şifre",
                              labelStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              password1 = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Şifre",
                              labelStyle: TextStyle(color: Colors.red),
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) {
                              password2 = value;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              child: Text("Kayıt Ol"),
                              onPressed: () {
                                _formState.currentState.save();

                                if (password1 != password2) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Setting String"),
                                        content:
                                            new Text("Şifreler uyuşmuyor!"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("OK"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  debugPrint(
                                      "email: $userName, password: $password1");
                                }
                              },
                            ),
                            RaisedButton(
                              child: Text("Vazgeç"),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                            )
                          ],
                        ),
                      ]),
                ))));
  }
}
