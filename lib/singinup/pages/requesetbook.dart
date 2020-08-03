import 'package:flutter/material.dart';
import 'package:librarybooklocator/singinup/pages/constants.dart';

class RequestBook extends StatefulWidget {
  @override
  _RequestBookState createState() => _RequestBookState();
}

class _RequestBookState extends State<RequestBook> {
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
              decoration: textInputDecoration.copyWith(hintText: 'Book Name'),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: textInputDecoration.copyWith(hintText: 'Author Name'),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {},
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
}
