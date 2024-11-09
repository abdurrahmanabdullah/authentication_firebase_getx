import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  Future<void> signUp(String email, String password) async {
    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Sign Up", "Account created successfully!");
      Get.offAllNamed("/home"); // Navigate to home after successful sign up
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signIn(String email, String password) async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Sign In", "Welcome back!");
      Get.offAllNamed("/home"); // Navigate to home after successful sign in
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}