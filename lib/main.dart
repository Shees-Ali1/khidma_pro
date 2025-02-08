import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For setting preferred orientations
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX package for state management
import 'package:khidma_pro/navbar_screens/navbar.dart';

import 'controllers/Service-Provider-Controller/Ui-Controllers/AvailabilityController.dart';
import 'controllers/Service-Provider-Controller/Ui-Controllers/BottomBarController.dart';
import 'controllers/auth_controllers/login_controller.dart';
import 'onboarding/splash_screen.dart'; // Your main navigation screen

// Import controllers for managing app logic


void main() async {
  // Ensure Flutter bindings are initialized before using GetX and ScreenUtil
  WidgetsFlutterBinding.ensureInitialized();

  // Set the preferred orientations to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize controllers for the app's state management
  Get.put(AvailabilityController());
  Get.put(BottomBarController());

  // Run the app after initialization
  runApp(const MyApp());
  Get.put(LoginController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800), // Set your design size for ScreenUtil
      minTextAdapt: true, // Ensure text scaling is based on design size
      splitScreenMode: true, // Enable split-screen mode for better UI on large screens
      builder: (context, child) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}