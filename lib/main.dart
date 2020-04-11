import 'package:employeeapp/screens/rootPage.dart';
import 'package:employeeapp/services/authentication.dart';
import 'package:flutter/material.dart';

import 'utils/styles.dart';

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
          )),
      home: RootPage(
        auth: new Auth(),
      ),
    );
  }
}
