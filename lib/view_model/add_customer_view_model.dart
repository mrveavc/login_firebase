import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/model/customer.dart';

class AddCustomerViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addCustomer(
      BuildContext context, String name, String gender, String age) async {
    Customer customer = Customer(name, gender, age);
    await _firestore.collection("customers").doc().set(customer.toMap());
    Navigator.pop(context);
  }
}
