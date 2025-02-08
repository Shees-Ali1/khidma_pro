
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/consts/colors.dart';


import '../consts/images.dart';
import '../consts/text.dart';


class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(viewportFraction: 1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          ///  Text Interactive Learning Courses & Quizzes.
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: CustomText(
                text: 'Quick and Easy Bookings',
                color: blackColor,
                fontWeight: FontWeight.w700,
                fontSize: 26.54.sp,
              )),
          SizedBox(
            height: 55.81.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 11.w),
              child: CustomText(
                text:
                'Schedule professional cleaning services in seconds, customized to your needs.',
                textAlign: TextAlign.center,
                color: greyColor,
                fontWeight: FontWeight.w600,
                fontSize: 15.17.sp,
              )),
          SizedBox(
            height: 55.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(eclipse),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: 143.h,
                  ),
                  SizedBox(
                      height: 217.h,
                      width: 217.w,
                      child: Image.asset(
                        onboard2,
                        fit: BoxFit.contain,
                      )),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
