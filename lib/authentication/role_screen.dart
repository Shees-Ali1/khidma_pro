import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/authentication/signup.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';
import 'package:khidma_pro/widgets/buttons.dart';

import '../Customer/Home/user_home_screen.dart';
import '../consts/text_styles.dart';
import '../techForm/main_techForm.dart';


class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  // Instantiate SignupController (or get it if using GetX)
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: skyblue,
      body: SingleChildScrollView( // Added SingleChildScrollView
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(topEclipse),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 85.h,
                    width: 267.w,
                    child: Image.asset(
                      Splash,
                    ),
                  ),
                  SizedBox(height: 98.h),
                  Text(
                    'Select Role',
                    style: jost700(35.sp, skyblue), // Changed color to primary
                  ),
                  SizedBox(height: 58.h),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      signupController.userRole.value = "Customer"; // Changed to .value
                      signupController.selectedIndex.value = 0;
                      if (kDebugMode) {
                        print(signupController.userRole.value); // Changed to .value
                      }
                    },
                    child: buildContainer(
                      'Customer',
                      user,
                      isSelected: signupController.selectedIndex.value == 0, // Changed to .value
                    ),
                  ),
                  SizedBox(
                    width: 19.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      signupController.userRole.value = "Tech"; // Changed to .value
                      signupController.selectedIndex.value = 1;
                      if (kDebugMode) {
                        print(signupController.userRole.value); // Changed to .value
                      }
                    },
                    child: buildContainer(
                      'Technician',
                      serviceProvider,
                      isSelected: signupController.selectedIndex.value == 1, // Changed to .value
                    ),
                  ),
                ],
              );
            }),
            SizedBox(
              height: 33.h,
            ),
         CustomButton(text: 'Continue',
           color: backgroundColor,
           textColor: skyblue,
           width: 311.w,
           onPressed: () {
       //    Get.to(MainTechForm());
      if (signupController.selectedIndex.value == 0) {
      // Navigate to Customer Signup
          Get.to(() => SignupScreen()); // Use Get.to for navigation
      } else if (signupController.selectedIndex.value == 1) {
      // Navigate to Tech Signup
      Get.to(() => MainTechForm()); // Use Get.to for navigation
      }
      },),
            SizedBox(
              height: 14.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'By signing up you agree to our ',
                      style: jost400(14.sp, black),
                    ),
                    TextSpan(
                      text: 'Terms of Services',
                      style: jost500(14.sp, backgroundColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Terms of Services
                          // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => TermsPage()));
                        },
                    ),
                    TextSpan(
                      text: ' and ',
                      style: jost400(14.sp, black),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: jost500(14.sp, backgroundColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Privacy Policy
                          // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
                        },
                    ),
                    TextSpan(
                      text: '.',
                      style: jost400(14.sp, backgroundColor),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String text, String image, {bool isSelected = false}) {
    return Container(
      width: 146.w,
      height: 167.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        border: isSelected
            ? Border.all(color: blackColor, width: 1)
            : Border.all(color: skyblue, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 85.w,
              height: 80.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: skyblue,
                image: DecorationImage(
                  scale: 2,
                  image: AssetImage(image),
                  colorFilter: ColorFilter.mode(
                    whiteColor, // Change the color and opacity
                    BlendMode.srcATop, // Blend mode to apply the color
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 29.h,
            ),
            Expanded(
              child: Text(
                text,
                style: jost700(14.sp, black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





//Example controller, implement in your project
class SignupController extends GetxController {
  RxString userRole = "".obs;
  RxInt selectedIndex = 0.obs;
}

