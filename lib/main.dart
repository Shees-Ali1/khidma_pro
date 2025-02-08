import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:khidma_pro/navbar_screens/navbar.dart';

import 'controllers/Service-Provider-Controller/Ui-Controllers/AvailabilityController.dart';
import 'controllers/Service-Provider-Controller/Ui-Controllers/BottomBarController.dart';



void main() {
  Get.put(AvailabilityController());
  Get.put(BottomBarController());



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800), // Set your Figma design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
          debugShowCheckedModeBanner: false,
          home: BottomBar(),
        );
      },
    );
  }
}
