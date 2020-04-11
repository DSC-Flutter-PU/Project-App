import 'package:employeeapp/screens/account.dart';
import 'package:employeeapp/services/authentication.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> job1 = Map<String, String>();
  Map<String, String> job2 = Map<String, String>();
  List<Map<String, String>> jobs = <Map<String, String>>[];

  @override
  void initState() {
    super.initState();

    job1.putIfAbsent("name", () => "Trim my fence");
    job1.putIfAbsent("description", () => "Need someone to trim my fence");
    job1.putIfAbsent("date", () => DateTime.now().year.toString());

    job2.putIfAbsent("name", () => "Cut my grass");
    job2.putIfAbsent("description", () => "Need someone to cut my grass");
    job2.putIfAbsent("date", () => DateTime.now().year.toString());

    jobs.add(job1);
    jobs.add(job2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Account()));
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: ((BuildContext context, int index) {
            return ListTile(
              title: Text(
                jobs[index]["name"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                ),
              ),
              subtitle: Text(
                jobs[index]["description"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                ),
              ),
              trailing: Text(
                jobs[index]["date"],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                ),
              ),
              onTap: () {},
            );
          }),
          itemCount: jobs.length,
        ),
      ),
    );
  }
}