import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/app/modules/home/controllers/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => authController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      authController.signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    child: Text("Sign In"),
                  )),
          ],
        ),
      ),
    );
  }
}