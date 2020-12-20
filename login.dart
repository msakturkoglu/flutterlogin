import 'package:flutter/material.dart';
import 'package:login/Anasayfa.dart';
import 'package:login/sifremiUnuttum.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName;
  String password;

  final _loginInfo = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Form(
            key: _loginInfo,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        password = value;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(child: Text("Üye Ol"), onPressed: () {}),
                      MaterialButton(
                          child: Text("Şifremi Unuttum"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SifremiUnuttum()));
                          })
                    ],
                  ),
                  RaisedButton(
                    child: Text("Giriş"),
                    onPressed: () {
                      _loginInfo.currentState.save();
                      debugPrint("userName: $userName, password: $password");

                      if (userName == "demo" && password == "demo") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Anasayfa()));
                      } else {
                        debugPrint("Kullanıcı adı veya şifre hatalı!");
                      }
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
