import 'package:employeeapp/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                Text("Username"),
                Expanded(
                  child: TextField(
                    onSubmitted: (String text) {},
                  ),
                )
              ],
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
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              child: Text("Don't have an account?, Create one"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
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
                  child: Text("Login"),
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
