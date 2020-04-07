import "dart:async";

import 'package:employeeapp/data/Employee.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  Database _database;

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
            """CREATE TABLE employees(id INTEGER PRIMARY KEY,name TEXT,username TEXT,password TEXT,age NUMBER,rating NUMBER,count NUMBER,creationDate TEXT)""",
          );
        },
      );
    }
  }

  // add employee to database, check if number is not null, else method is not successful,
  // e.g Username is already taken error. Todo throw appropriate custom errors here
  Future<int> addEmployee(Employee employee) async {
    int id = employee.id;
    var count = 0;
    if (id != null)
      count = Sqflite.firstIntValue(await _database
          .rawQuery("SELECT COUNT(*) FROM employees where id =?", [id]));

    if (count == 0) {
      var number = Sqflite.firstIntValue(await _database.rawQuery(
          "SELECT COUNT(*) FROM employees where username =?",
          [employee.username]));

      if (number != 0) {
        // user exists in the database with the name, notify user to choose a
        // new username
        // todo throw better info
        return null;
      }
      // add the user to db
      id = await _database.insert("employees", employee.toMap());
    } else {
      id = await _database.update("employees", employee.toMap(),
          where: "id=?", whereArgs: [employee.id]);
    }

    return id;
  }

  Future<int> authenticateUser(String username, String password) async {
    var count = Sqflite.firstIntValue(await _database.rawQuery(
        "SELECT COUNT(*) FROM employees where username =?", [username]));

    if (count == 0) {
      // no user exists with the name in the database
      throw User404Exception(
          "No user found with the given details, please try again with different credentials.");
    } else {
      List<Employee> employees = new List();

      List<Map> results = await _database
          .rawQuery("select * from employees where username = ?", [username]);
      results.forEach((s) {
        Employee emp = new Employee.fromJson(s);
        employees.add(emp);
      });

      Employee fetchEmployee = employees.first;
      if (await fetchEmployee.matchPassword(password, fetchEmployee.password)) {
        // successful authentication
        return 0;
      } else {
        // failed to authenticate, confirm details
        throw User404Exception(
            "No user found with the given details, please try again with different credentials.");
      }
    }
  }

  // delete employee from database, check if number is not null, else method is not successful,
  // e.g User was not found. Todo throw appropriate custom errors here
  Future<void> deleteEmployee(int employeeId) async {
    var count = Sqflite.firstIntValue(await _database
        .rawQuery("SELECT COUNT(*) FROM employees where id =?", [employeeId]));

    if (count != 0) {
      await _database
          .rawDelete("DELETE FROM employees WHERE id = ?", [employeeId]);

      return employeeId;
    } else {
      return null;
    }
  }
}
