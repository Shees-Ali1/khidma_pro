import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  void signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Simulating API call

    isLoading.value = false;
    Get.snackbar("Success", "Account created successfully", snackPosition: SnackPosition.BOTTOM);
    Get.offAllNamed('/login'); // Navigate to login screen after signup
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
