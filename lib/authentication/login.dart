import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/authentication/signup.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';
import 'package:khidma_pro/consts/text.dart';
import 'package:khidma_pro/navbar_screens/User_navbar.dart';
import 'package:khidma_pro/navbar_screens/navbar.dart';
import 'package:khidma_pro/widgets/buttons.dart';
import 'package:khidma_pro/widgets/textfield.dart';
import '../controllers/auth_controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView( // Added SingleChildScrollView
            child: Column(
              children: [
                SizedBox(height: 25.h),
                _buildSignupPrompt(),
                SizedBox(height: 13.h),
                _buildLogo(),
                SizedBox(height: 18.h),
                _buildLoginTitle(),
                SizedBox(height: 16.h),
                _buildEmailInputField(),
                SizedBox(height: 16.h),
                _buildPasswordInputField(),
                SizedBox(height: 6.h),
                _buildRememberMe(),
                SizedBox(height: 23.h),
                _buildLoginButton(),
                SizedBox(height: 8.h),
                _buildForgotPassword(),
                SizedBox(height: 31.h),
                _buildOrDivider(),
                SizedBox(height: 21.h),
                _buildSocialLoginOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
          text: 'First time here?',
          color: greyColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(width: 5.w),
        GestureDetector(
          onTap: () {
            Get.to(SignupScreen());
          },
          child: CustomText(
            text: 'Sign up',
            color: greenColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return SizedBox(height: 82.h, width: 219.w, child: Image.asset(Splash));
  }

  Widget _buildLoginTitle() {
    return CustomText(
      text: 'Login',
      fontWeight: FontWeight.w700,
      fontSize: 35.sp,
      color: skyblue,
    );
  }

  Widget _buildEmailInputField() {
    return CustomInputField(
      controller: controller.emailController,
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      hintText: 'Email',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          email,
          width: 20,
          height: 20,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildPasswordInputField() {
    return CustomInputField(
      controller: controller.passwordController,
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      hintText: 'Password',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset(
          password,
          width: 13.w,
          height: 15.h,
          fit: BoxFit.contain,
        ),
      ),
      obscureText: true,
    );
  }

  Widget _buildRememberMe() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, top: 14.25.h),
      child: Row(
        children: [
          Obx(
                () => GestureDetector(
              onTap: () {
                controller.toggleValue(!controller.checkValue.value);
              },
              child: Container(
                width: 20.w,
                height: 19.h,
                decoration: BoxDecoration(
                  color:
                  controller.checkValue.value ? skyblue : backgroundColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: textfieldBorder, width: 0.5),
                ),
                child: controller.checkValue.value
                    ? const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                )
                    : null,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Remember information',
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return CustomButton(
      text: 'Login',
      onPressed: () {
        Get.to(UserBottomBar());
      },
      color: skyblue,
      width: 311.w,
    );
  }

  Widget _buildForgotPassword() {
    return CustomText(
      text: 'Forget password?',
      color: greenColor,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildOrDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 136.w,
          color: textfieldBorder,
          height: 1,
        ),
        CustomText(
          text: 'or',
          color: greyColor,
          fontSize: 13.sp,
        ),
        Container(
          width: 136.w,
          color: textfieldBorder,
          height: 1,
        ),
      ],
    );
  }

  Widget _buildSocialLoginButton(String imagePath, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
      height: 43.h,
      width: 310.w,
      decoration: BoxDecoration(
        color: textfieldColor,
        borderRadius: BorderRadius.circular(13.r),
        border: Border.all(color: textfieldBorder, width: 0.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: Image.asset(imagePath),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                height: 25.h,
                width: 1.w,
                decoration: BoxDecoration(color: textfieldBorder),
              ),
            ],
          ),
          CustomText(
            text: 'Login with $text',
            color: greyColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(), // Placeholder for spacing
        ],
      ),
    );
  }

  Widget _buildSocialLoginOptions() {
    return Column(
      children: [
        _buildSocialLoginButton(google, 'Google'),
        SizedBox(height: 18.h),
        _buildSocialLoginButton(facebook, 'Facebook'),
        SizedBox(height: 18.h),
        _buildSocialLoginButton(apple, 'Apple'),
      ],
    );
  }
}