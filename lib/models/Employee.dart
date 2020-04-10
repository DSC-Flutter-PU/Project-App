import 'package:flutter/cupertino.dart';
import 'package:password/password.dart';

class Employee {
  int id;
  String name;
  String username;
  String password;
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
  Employee({
    int id,
    @required String name,
    @required String username,
    @required String password,
    @required int age,
    double rating,
    int count,
  }) {
    if (name == null || name == "") {
      return;
    } else if (username == null || username == null) {
      return;
    } else if (password == null || password == null) {
      return;
    } else if (age == null || age < 18) {
      return;
    }

    this.name = name;
    this.username = username;
    this.password = hashPassword(password);
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
      'password': password,
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
            password: data['password'],
            age: data['age'],
            rating: data['rating'].toDouble());

  String hashPassword(String originalPassword) {
    return Password.hash(originalPassword, new PBKDF2());
  }

  Future<bool> matchPassword(String password, String hash) async {
    return Password.verify(password, hash);
  }
}
