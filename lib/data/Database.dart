import "dart:async";

import 'package:employeeapp/data/Employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  Database _database;
  Transaction txn;

  // creates database instance
  Future create() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "database.db");

    if (_database == null) {
      _database = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (
          db,
          version,
        ) {
          return db.execute(
            "CREATE TABLE employees(id INTEGER PRIMARY KEY,name TEXT,username TEXT,password TEXT,creationDate TEXT,rating NUMBER,username TEXT,password TEXT)",
          );
        },
      );
    }

    if (txn == null) {
      await _database.transaction((tx) async {
        tx = txn;
      });
    }
  }

  // add employee to database, check if number is not null, else method is not successful,
  // e.g Username is already taken error. Todo throw appropriate custom errors here
  Future<int> addEmployee(Employee employee) async {
    int id = employee.id;
    var count = Sqflite.firstIntValue(
        await txn.rawQuery("SELECT COUNT(*) FROM employees where id =?", [id]));

    if (count == 0) {
      var number = Sqflite.firstIntValue(await txn.rawQuery(
          "SELECT COUNT(*) FROM employees where username =?",
          [employee.username]));

      if (number != 0) {
        return null;
      }
      id = await txn.insert("employees", employee.toMap());
    } else {
      id = await txn.update("employees", employee.toMap(),
          where: "id=?", whereArgs: [employee.id]);
    }

    return id;
  }

  // delete employee from database, check if number is not null, else method is not successful,
  // e.g User was not found. Todo throw appropriate custom errors here
  Future<void> deleteEmployee(int employeeId) async {
    var count = Sqflite.firstIntValue(await txn
        .rawQuery("SELECT COUNT(*) FROM employees where id =?", [employeeId]));

    if (count != 0) {
      await txn.rawDelete("DELETE FROM employees WHERE id = ?", [employeeId]);

      return employeeId;
    } else {
      return null;
    }
  }
}
