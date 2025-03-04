import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/colors.dart';
import '../consts/images.dart';
import '../consts/text.dart';



class OnBoardingFive extends StatelessWidget {
  const OnBoardingFive({super.key});

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
                text: 'We Value Your Feedback',
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
                'Rate your service and help us improve to serve you better.',
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
                    onboard5,
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
