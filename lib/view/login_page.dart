import 'package:flutter/material.dart';
import 'package:login_firebase/view/common/common_text_field.dart';
import 'package:login_firebase/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 235, 235),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Login',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 62, 56, 56),
                    fontSize: 25),
              ),
              const SizedBox(
                height: 80,
              ),
              _buildEmailTextField(),
              const SizedBox(
                height: 30,
              ),
              _buildPasswordTextField(),
              const SizedBox(
                height: 40,
              ),
              _buildLoginButton(context),
              _buildOpenRegisterButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CommonTextField(
      controller: _emailController,
      label: 'Email',
    );
  }

  Widget _buildPasswordTextField() {
    return CommonTextField(
      controller: _passwordController,
      label: 'Password',
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      onPressed: () {
        viewModel.login(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(400, 50),
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 237, 223, 239),
        side: const BorderSide(
            width: 2, color: Color.fromARGB(255, 230, 189, 237)),
      ),
      child: const Text("Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }

  Widget _buildOpenRegisterButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return TextButton(
      child: Text("Don't have an account ? Sign Up"),
      onPressed: () {
        viewModel.openRegisterPage(context);
      },
    );
  }
}
