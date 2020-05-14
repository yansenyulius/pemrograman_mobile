import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:loginfirebase/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              // ignore: missing_return
              validator: (input) {
                if (input.isEmpty) {
                  return 'Masukkan alamat email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(
                  labelText: 'Email'
              ),
            ),
            TextFormField(
              // ignore: missing_return
              validator: (input) {
                if (input.length < 6) {
                  return 'Password minimal 6 karakter';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }

   Future<void> signIn() async{
      final formState = _formKey.currentState;
      if(formState.validate()){
        formState.save();
        try{
          Future<AuthResult> user = (FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password));
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
        }catch(e){
          print(e.message);
        }
      }
    }
  }