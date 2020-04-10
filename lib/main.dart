import 'package:employeeapp/screens/account.dart';
import 'package:employeeapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'utils/styles.dart';

import 'screens/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: appBarTextStyle,
          ),
        ),
        textTheme: TextTheme(
          title: titleTextStyle,
        )
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
      drawer: Drawer(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Image.asset(
                  "images/dr.jpeg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            RaisedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            RaisedButton(
              child: Text("Register"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
            )
          ],
        ),
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
