import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task1/app/modules/home/views/home_view.dart';

class SignInController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Reactive variables for email, password, and loading state
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  // Form validation method
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Method to handle form submission
  void submit(BuildContext context) {
    if (validateForm()) {
      isLoading(true); // Show loading indicator
      signInMethod(context, email.value, password.value);
    }
  }

  // Sign-in method
  Future<void> signInMethod(BuildContext context, String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ).then((value) {
        isLoading(false); // Hide loading indicator
        Get.snackbar("Log in", "Logged in successfully!");
        Get.to(const HomeView());
      }).catchError((error) {
        isLoading(false); // Hide loading indicator
        Get.snackbar("Log in Error", error.toString());
      });
    } catch (error) {
      isLoading(false); // Hide loading indicator
      print("Error during log in: $error");
    }
  }
}
