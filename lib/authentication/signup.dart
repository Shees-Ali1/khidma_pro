import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: controller.passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            TextField(
              controller: controller.confirmPasswordController,
              decoration: InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: controller.signup,
              child: Text("Sign Up"),
            )),
          ],
        ),
      ),
    );
  }
}
