import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/colors.dart';
import '../consts/images.dart';
import '../consts/text.dart';



class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(viewportFraction: 1);

    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 90.h,
          ),
          ///  Text Interactive Learning Courses & Quizzes.
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: CustomText(
                text: 'Pay Your Way',
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
                'Choose from multiple secure payment options like cards, Apple Pay, or Google Pay.',
                textAlign: TextAlign.center,
                color: greyColor,
                fontWeight: FontWeight.w600,
                fontSize: 15.17.sp,
              )),
          SizedBox(
            height: 68.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(eclipse),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Image.asset(
                    onboard3,
                    height: 240.h,
                    width: 240.w,
                    fit: BoxFit.cover,


                  ),
                  SizedBox(
                    height: 59.h,
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
