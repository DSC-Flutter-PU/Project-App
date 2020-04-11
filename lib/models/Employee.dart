import 'package:flutter/cupertino.dart';

class Employee {
  int id;
  String name;
  String username;
  int age;
  double rating;
  int count; // Number of people who have rated the user
  String creationDate;

  // Getters and setters
  int rateUser(int rating) {
    this.rating = addRating(this, rating).rating;

    return rating;
  }

  // Constructors
  // toHash is whether to hash the password or not.
  // When adding a user to the database, pass it as true,
  // else, false. i.e When coercing a map from the db to an employee
  Employee({
    int id,
    @required String name,
    @required String username,
    @required int age,
    double rating,
    int count,
  }) {
    if (name == null || name == "") {
      return;
    } else if (username == null || username == null) {
      return;
    } else if (age == null || age < 18) {
      return;
    }

    this.name = name;
    this.username = username;
    this.age = age;
    this.rating = rating != null ? rating : 0;
    this.count = count != null ? count : 0;
    this.creationDate = DateTime.now().toString();
  }

  // helper methods
  Employee addRating(Employee employee, int rating) {
    employee.count += 1;
    employee.rating = (employee.rating + rating) / 2;

    return employee;
  }

  // helper methods
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'age': age,
      'rating': rating,
      'count': count,
      'creationDate': creationDate
    };
  }

  Employee.fromJson(Map data)
      : this(
            id: data['id'],
            name: data['name'],
            username: data['username'],
            age: data['age'],
            rating: data['rating'].toDouble());
}
