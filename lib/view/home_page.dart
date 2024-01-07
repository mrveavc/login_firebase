import 'package:flutter/material.dart';
import 'package:login_firebase/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = Provider.of<HomeViewModel>(
      context,
      listen: false,
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 235, 235),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 197, 197),
        centerTitle: true,
        title: const Text(
          "Customers",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 88, 85, 85)),
        ),
      ),
      body: _buildGetCustomerList(context),
      floatingActionButton: ElevatedButton(
        child: const Text('Add Customer'),
        onPressed: () {
          viewModel.openAddCustomerPage(context);
        },
      ),
    );
  }

  Widget _buildGetCustomerList(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.customer.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  viewModel.customer[index].gender == "Kadin"
                      ? Image.network(
                          "https://thumbs.dreamstime.com/b/d-icon-avatar-woman-illustration-smiling-happy-girl-cartoon-close-up-portrait-standing-girl-isolated-transparent-png-274189966.jpg",
                          width: 100,
                        )
                      : Image.network(
                          "https://cdn0.iconfinder.com/data/icons/social-media-network-4/48/male_avatar-512.png",
                          width: 100,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name: ${viewModel.customer[index].name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Gender : ${viewModel.customer[index].gender}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Age : ${viewModel.customer[index].age}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
