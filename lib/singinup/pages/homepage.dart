import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:librarybooklocator/singinup/pages/constants.dart';
import 'package:librarybooklocator/singinup/pages/signout.dart';

import 'modal.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // FirebaseAuth auth = FirebaseAuth.instance;

  /*getUID() async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    return  uid;
  }*/
  //final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Modal modal = new Modal();

    return Scaffold(
       resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('LibraryBookLocator'),
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person,color: Colors.white,),
              label: Text('logout',style: TextStyle(color: Colors.white),),
              onPressed: () async{
          //      await _auth.signOut();
              },
            ),
          ],
        ),
      backgroundColor: Colors.brown[100],

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            new Padding(padding: const EdgeInsets.all(20.0),
              child: new Text('Search Book',style: TextStyle(fontSize: 20,color: Colors.brown),textAlign: TextAlign.center,),),
              TextField(
                decoration: textInputDecoration.copyWith(hintText: 'Book Name'),
              ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: (){},
              color: Colors.brown[300],
              child: Text('Search',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: ()=> modal.mainBottomSheet(context),
          backgroundColor: Colors.brown[400],
          child: new Icon(Icons.open_in_new,color: Colors.white,),
      ),
    );
  }
}
