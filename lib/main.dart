import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/navbar_screens/User_navbar.dart';
import 'Customer/Home/task_description_video.dart';
import 'Customer/Home/user_home_screen.dart';
import 'Customer/Home/wallet_screen.dart';
import 'controllers/Service-Provider-Controller/Ui-Controllers/AvailabilityController.dart';
import 'controllers/Service-Provider-Controller/Ui-Controllers/BottomBarController.dart';
import 'controllers/auth_controllers/login_controller.dart';
import 'onboarding/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the preferred orientations to portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Get.put(AvailabilityController());
  Get.put(BottomBarController());
  Get.put(HomeController());

  // Run the app after initialization
  runApp(const MyApp());
  Get.put(LoginController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode:
          true,
      builder: (context, child) {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
