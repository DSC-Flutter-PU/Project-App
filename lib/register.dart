import 'package:employeeapp/main.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Firstname"),
                Expanded(
                  child: TextField(
                    onSubmitted: (String text) {},
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Text("Lastname"),
                Expanded(
                  child: TextField(
                    onSubmitted: (String text) {},
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: <Widget>[
                Text("Password"),
                Expanded(
                  child: TextField(
                    onSubmitted: (String text) {},
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("Confirm Password"),
                Expanded(
                  child: TextField(
                    onSubmitted: (String text) {},
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              child: Text("Have an account?, Login"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text("Cancel"),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: Text("Register"),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
