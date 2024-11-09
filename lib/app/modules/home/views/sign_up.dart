import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task1/app/modules/home/views/home_view.dart';
import 'package:task1/app/modules/home/views/sign_in.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpScreen({super.key});

  void _submit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      // Add sign-up logic here
      print('Sign Up with Name: $name, Email: $email');
      signUpMethod(context, email, password); // Call the signUpMethod with email and password
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _submit(context), // Use _submit instead of directly calling signUpMethod
                child: const Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: Row(
                  children: [
                    const Text('Already have an account?'),
                    TextButton(onPressed: (){
                      Get.to(LoginScreen());
                    }, child: const Text("Login here",style: TextStyle(color: Colors.pink),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUpMethod(BuildContext context, String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ).then((value) {
        Get.snackbar("Sign Up", "Signed up successfully!");
        Get.to( LoginScreen());
      }).catchError((error) {
        Get.snackbar("Sign Up Error", error.toString());
      });
    } catch (error) {
      print("Error during sign-up: $error");
    }
  }
}
