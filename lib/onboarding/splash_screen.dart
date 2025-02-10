import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';
import 'package:khidma_pro/onboarding/main_onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds:4 ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainOnBoardingView()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: backgroundColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(Splash),
            )
          ],
        ),
      ),
    );
  }
}
