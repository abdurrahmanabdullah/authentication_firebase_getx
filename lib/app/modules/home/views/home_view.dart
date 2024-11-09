import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task1/app/modules/home/views/sign_up.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut().then((value){
              Get.snackbar("Logout", "user logout Successful");
              Get.offAll(SignUpScreen());
            });

    }, icon: const Icon(Icons.logout,color: Colors.blue,))
        ],
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
