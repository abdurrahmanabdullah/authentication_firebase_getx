import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/app/modules/home/controllers/sign_in_controller.dart';

import 'home_view.dart';

// class LoginScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   LoginScreen({super.key});
//
//   void _submit(BuildContext context) {
//     if (_formKey.currentState?.validate() ?? false) {
//       final email = emailController.text;
//       final password = passwordController.text;
//
//       signInMethod(context, email, password); // Call the signUpMethod with email and password
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                       .hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: const InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   } else if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () => _submit(context),// Use _submit instead of directly calling signUpMethod
//                 child: const Text('Sign in'),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> signInMethod(BuildContext context, String email, String password) async {
//
//     try {
//       await firebaseAuth.signInWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       ).then((value) {
//         Get.snackbar("Log in ", "Log in successfully!");
//         Get.to(const HomeView());
//       }).catchError((error) {
//         Get.snackbar("Log in Error", error.toString());
//       });
//     } catch (error) {
//       print("Error during Log in : $error");
//     }
//   }
//
// }

///---getx way
// Import the LoginController

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final SignInController signInController = Get.put(SignInController()); // Initialize controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: signInController.formKey, // Use the form key from controller
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email TextFormField
              TextFormField(
                onChanged: (value) {
                  signInController.email(value); // Bind email to reactive variable
                },
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password TextFormField
              TextFormField(
                onChanged: (value) {
                  signInController.password(value); // Bind password to reactive variable
                },
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

              // Submit button
              Obx(() {
                return ElevatedButton(
                  onPressed: signInController.isLoading.value
                      ? null
                      : () => signInController.submit(context),
                  child: signInController.isLoading.value
                      ? const CircularProgressIndicator() // Show loading indicator when logging in
                      : const Text('Sign In'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
