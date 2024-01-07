import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/model/customer.dart';
import 'package:login_firebase/view/add_customer_page.dart';
import 'package:login_firebase/view_model/add_customer_view_model.dart';
import 'package:provider/provider.dart';

class HomeViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Customer> _customer = [];

  List<Customer> get customer => _customer;

  HomeViewModel() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCustomers();
    });
  }

  void _getCustomers() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("customers").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
        in snapshot.docs) {
      Customer customer = Customer.fromMap(
        documentSnapshot.id,
        documentSnapshot.data(),
      );
      _customer.add(customer);
    }
    notifyListeners();
  }

  void openAddCustomerPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AddCustomerViewModel(),
        child: AddCustomerPage(),
      ),
    );
    Navigator.push(context, pageRoute).then(
      (value) {
        _customer.clear();
        _getCustomers();
      },
    );
  }
}
