import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task1/app/modules/home/views/sign_in.dart';
//
// class SignUpController extends GetxController {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   final formKey = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//   void submit(BuildContext context) {
//     if (formKey.currentState?.validate() ?? false) {
//       final name = nameController.text;
//       final email = emailController.text;
//       final password = passwordController.text;
//       print('Sign Up with Name: $name, Email: $email');
//       signUpMethod(context, email, password);
//     }
//   }
//   Future<void> signUpMethod(BuildContext context, String email, String password) async {
//     try {
//       await firebaseAuth.createUserWithEmailAndPassword(
//         email: email.trim(),
//         password: password.trim(),
//       ).then((value) {
//         Get.snackbar("Sign Up", "Signed up successfully!");
//         Get.to( LoginScreen());
//       }).catchError((error) {
//         Get.snackbar("Sign Up Error", error.toString());
//       });
//     } catch (error) {
//       print("Error during sign-up: $error");
//     }
//   }
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//
// }
///-----------------getx way
///import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // Make sure to import your LoginScreen
//
// class SignUpController extends GetxController {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//   // Make variables reactive with Rx
//   var name = ''.obs;
//   var email = ''.obs;
//   var password = ''.obs;
//   var isSubmitting = false.obs;
//
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   void submit(BuildContext context) {
//     if (formKey.currentState?.validate() ?? false) {
//       isSubmitting.value = true; // Set submitting state to true while submitting
//       signUpMethod(context);
//     }
//   }
//
//   Future<void> signUpMethod(BuildContext context) async {
//     try {
//       await firebaseAuth.createUserWithEmailAndPassword(
//         email: email.value.trim(),
//         password: password.value.trim(),
//       );
//       Get.snackbar("Sign Up", "Signed up successfully!");
//       Get.to(() => LoginScreen());
//     } on FirebaseAuthException catch (error) {
//       Get.snackbar("Sign Up Error", error.message ?? "Error occurred");
//     } finally {
//       isSubmitting.value = false; // Reset submitting state after the process
//     }
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//}
///  learn
class SignUpController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  // Make variables reactive with Rx
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isSubmitting = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
  void submit(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      isSubmitting.value = true; // Set submitting state to true while submitting
      signUpMethod(context);
    }
  }
  Future<void> signUpMethod(BuildContext context) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email.value.trim(),
        password: password.value.trim(),
      );
      Get.snackbar("Sign Up", "Signed up successfully!");
      Get.to(() => LoginScreen());
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Sign Up Error", error.message ?? "Error occurred");
    } finally {
      isSubmitting.value = false;
    }
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}