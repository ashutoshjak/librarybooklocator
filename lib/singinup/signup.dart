import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:librarybooklocator/singinup/loginpage.dart';
import 'package:librarybooklocator/singinup/pages/constants.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _email, _password;
  String error='';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 1,
        title: Text('Sigup'),
      ),
      backgroundColor: Colors.brown[200],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
       child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (input) {
                  if (input.isEmpty) {
                    return 'Provide email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (input) {
                  if (input.length < 6) {
                    return 'Please long password ';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: signUp,
                color: Colors.brown[300],
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red,fontSize: 14.0),
              ),
            ],
          ),
        ),
      )
    );
  }

  void signUp() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult result = (await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _email, password: _password));
        FirebaseUser user =result.user;
        user.sendEmailVerification();
        //Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage(),fullscreenDialog: true));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
