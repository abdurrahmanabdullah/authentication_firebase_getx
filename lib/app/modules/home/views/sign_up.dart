
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:task1/app/modules/home/controllers/sign_up_controller.dart';
import 'package:task1/app/modules/home/views/sign_in.dart';


// class SignUpScreen extends StatelessWidget {
//   final SignUpController signUpController = Get.put(SignUpController());
//   SignUpScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Sign Up')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key:  signUpController.formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: signUpController.nameController,
//                 decoration: const InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller:signUpController. emailController,
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
//                 controller:signUpController. passwordController,
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
//                 onPressed: () => signUpController.submit(context), // Use _submit instead of directly calling signUpMethod
//                 child: const Text('Sign Up'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Get.to(() => LoginScreen()); // Use Get.to() to navigate with GetX
//                 },
//                 child: Row(
//                   children: [
//                     const Text('Already have an account?'),
//                     TextButton(onPressed: (){
//                       Get.to(LoginScreen());
//                     }, child: const Text("Login here",style: TextStyle(color: Colors.pink),))
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }
///---getx way
class SignUpScreen extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: signUpController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Name TextField
              Obx(() => TextFormField(
                initialValue: signUpController.name.value,
                onChanged: (value) => signUpController.name.value = value,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              )),
              const SizedBox(height: 16),

              // Email TextField
              Obx(() => TextFormField(
                initialValue: signUpController.email.value,
                onChanged: (value) => signUpController.email.value = value,
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
              )),
              const SizedBox(height: 16),

              // Password TextField
              Obx(() => TextFormField(
                initialValue: signUpController.password.value,
                onChanged: (value) => signUpController.password.value = value,
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
              )),
              const SizedBox(height: 24),

              // Submit Button
              Obx(() => ElevatedButton(
                onPressed: signUpController.isSubmitting.value ? null : () => signUpController.submit(context),
                child: signUpController.isSubmitting.value
                    ? const CircularProgressIndicator()
                    : const Text('Sign Up'),
              )),

              // Login Redirect
              TextButton(
                onPressed: () => Get.to(() => LoginScreen()),
                child: Row(
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      child: const Text(
                        "Login here",
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
