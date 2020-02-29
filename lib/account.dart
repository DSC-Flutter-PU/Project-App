import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account details"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Image.asset("images/dr.jpeg"),
              ),
              SizedBox(
                height: 15.0,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Row(
                  children: <Widget>[
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 22.0),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "Dr Disrespect",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.rate_review),
                title: Row(
                  children: <Widget>[
                    Text(
                      "Rating",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "4/100",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
