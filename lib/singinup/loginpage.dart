import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:librarybooklocator/singinup/pages/constants.dart';
import 'package:librarybooklocator/singinup/pages/homepage.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email,_password;
  String error='';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 1,
        title: Text('Sigin'),
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
                validator: (input){
                  if(input.isEmpty){
                    return'Please enter email';
                  }
                },
                onSaved: (input)=> _email = input,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (input){
                  if(input.length<6){
                    return 'Please enter password upt0 6 characters';
                  }
                },
                onSaved: (input)=> _password = input,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: signIn,
                color: Colors.brown[300],
                child: Text('Signin',style: TextStyle(color: Colors.white),),

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

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user =result.user;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }catch(e){
        print(e.message);

      }
    }
  }
}

