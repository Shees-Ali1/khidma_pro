import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Simulating API call

    isLoading.value = false;
    Get.snackbar("Success", "Logged in successfully", snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed('/home'); // Navigate to home screen after login
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
