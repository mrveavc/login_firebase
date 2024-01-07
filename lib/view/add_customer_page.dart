import 'package:flutter/material.dart';
import 'package:login_firebase/view/common/common_text_field.dart';
import 'package:login_firebase/view_model/add_customer_view_model.dart';
import 'package:provider/provider.dart';

class AddCustomerPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  AddCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 235, 197, 197),
          centerTitle: true,
          title: const Text(
            "Add Customer",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 88, 85, 85)),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const SizedBox(height: 80),
                  _buildNameTextField(),
                  const SizedBox(height: 16),
                  _buildGenderTextField(),
                  const SizedBox(height: 16),
                  _buildAgeTextField(),
                  const SizedBox(height: 80),
                  _buildAddCustomerButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameTextField() {
    return CommonTextField(
      controller: _nameController,
      label: "Name",
    );
  }

  Widget _buildGenderTextField() {
    return CommonTextField(
      controller: _genderController,
      label: "Gender",
    );
  }

  Widget _buildAgeTextField() {
    return CommonTextField(
      controller: _ageController,
      label: "Age",
    );
  }

  Widget _buildAddCustomerButton(BuildContext context) {
    AddCustomerViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: const Text("Add Customer"),
      onPressed: () {
        viewModel.addCustomer(context, _nameController.text.trim(),
            _genderController.text.trim(), _ageController.text.trim());
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(400, 50),
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 237, 223, 239),
        side: const BorderSide(
            width: 2, color: Color.fromARGB(255, 230, 189, 237)),
      ),
    );
  }
}
