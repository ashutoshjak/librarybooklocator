//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:librarybooklocator/singinup/pages/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RequestBook extends StatefulWidget {

  @override
  _RequestBookState createState() => _RequestBookState();
}

class _RequestBookState extends State<RequestBook> {
//  TextEditingController _book_name = new TextEditingController();
//  TextEditingController _author_name = new TextEditingController();

  final _book_name = TextEditingController();
  final _author_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Request Book'),
        backgroundColor: Colors.brown[400],
      ),
      backgroundColor: Colors.brown[100],
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            TextField(
              controller: _book_name,
              decoration: textInputDecoration.copyWith(hintText: 'Book Name'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _author_name,
              decoration: textInputDecoration.copyWith(hintText: 'Author Name'),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: addData,
              color: Colors.brown[300],
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addData() async {
    String url = "http://10.0.2.2/";
    await http
        .post(url,
            headers: {'Accept': 'application/json'},
            body: ({
              "book_name": _book_name.text,
              "author_name": _author_name.text,
            }))
        .then((response) {
      if (response.statusCode == 201) {
        success();
      } else {
        failed();
      }
    });
  }

  void success() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Submitted Sucessfully"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void failed() {
//    var context;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Could not add "),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
