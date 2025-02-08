import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:khidma_pro/navbar_screens/navbar.dart';
import 'package:khidma_pro/onboarding/splash_screen.dart';
import 'package:khidma_pro/role_screen.dart'; // Import your BottomBar

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: RoleScreen(),
        );
      },
    );
  }
}