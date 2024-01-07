import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;

  const CommonTextField({super.key, this.controller, this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color.fromARGB(255, 187, 134, 196),
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        label: Text(label ?? ""),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
