import 'package:flutter/material.dart';
import 'package:login/login.dart';

class SifremiUnuttum extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<SifremiUnuttum> {
  String email;

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
                        email = value;
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text("Gönder"),
                    onPressed: () {
                      _loginInfo.currentState.save();
                      debugPrint(
                          "$email adresine şifre sıfırlama linki gönderildi.");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}
