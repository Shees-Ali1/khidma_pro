import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/onboarding/onboard4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../authentication/login.dart';
import 'onboard1.dart';
import 'onboard2.dart';
import 'onboard3.dart';
import 'onboard5.dart';






class MainOnBoardingView extends StatefulWidget {
  const MainOnBoardingView({super.key});

  @override
  State<MainOnBoardingView> createState() => _MainOnBoardingViewState();
}

class _MainOnBoardingViewState extends State<MainOnBoardingView> {
  PageController pageController = PageController();
  int currentpage = 0;

  void _moveToNextPage() {
    // Check if there is a next page
    if (currentpage < 4) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else if (currentpage == 4) {
      Get.offAll(LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentpage + 1) / 5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            //   physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentpage = index;
              });
            },
            children: const [
              OnBoardingOne(),
              OnBoardingTwo(),
              OnBoardingThree(),
              OnBoardingFour(),
              OnBoardingFive(),

            ],
          ),

          // Positioned navigation controls (progress indicator and arrow button)
          Container(
            alignment: const Alignment(0, 0.92),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Page Indicator
                  SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotWidth: 9.w,
                      dotHeight: 9.h,
                      activeDotColor: greenColor,
                      dotColor: Colors.white,
                    ),
                    controller: pageController,
                    count: 5,
                  ),

                  // Arrow button with circular progress
                  GestureDetector(
                    onTap: () {
                      _moveToNextPage();
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // Button color
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 65,
                          height: 65,
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 1.5,
                            backgroundColor:
                            Colors.white.withOpacity(0.5),
                            valueColor: AlwaysStoppedAnimation<Color>(greenColor),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
