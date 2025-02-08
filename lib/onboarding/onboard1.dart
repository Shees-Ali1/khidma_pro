import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/text.dart';
import '../consts/images.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(viewportFraction: 1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 70.h,
          ),

          // Heading 1
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomText(
                text: 'Welcome to\nKhidma Pro',
                color: blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 26.54.sp,
              )),

          SizedBox(
            height: 40.81.h,
          ),

          // ? Short Heading
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: CustomText(
                text:
                    'Connecting you with trusted local professionals for any service. Choose from cleaning, plumbing, electrical work, and more!',
                textAlign: TextAlign.center,
                color: greyColor,
                fontWeight: FontWeight.w600,
                fontSize: 15.17.sp,
              )),
          SizedBox(
            height: 40.19.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(eclipse),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 246.h,
                    width: 230.w,
                    child: Image.asset(
                      onboard1,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // SizedBox(
                  //   height: 60.h,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
