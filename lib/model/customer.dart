import 'package:flutter/material.dart';

class Customer with ChangeNotifier {
  String? id;
  String name;
  String gender;
  String age;

  Customer(this.name, this.gender, this.age);

  Customer.fromMap(this.id, Map<String, dynamic> map)
      : name = map["name"],
        gender = map["gender"],
        age = map["age"];

  Map<String, dynamic> toMap() {
    return {"name": name, "gender": gender, "age": age};
  }
}
