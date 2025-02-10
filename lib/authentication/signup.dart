import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/widgets/buttons.dart';
import '../consts/images.dart';
import '../widgets/Custom_dropdown.dart';
import '../widgets/textfield.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: skyblue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(topEclipse),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),


                    SizedBox(
                      height: 85.h,
                      width: 267.w,
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                    SizedBox(height: 70.h),
                    Text(
                      'Sign up',
                      style: TextStyle(fontSize: 35.sp, color: skyblue, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomInputField(
                  label: 'Full Name',
                  prefixIcon: Icon(
                    Icons.person,
                    color: skyblue,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomInputField(
                  label: 'Your Email',
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: skyblue,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomInputField(
                  label: 'Your Password',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: skyblue,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomInputField(
                  label: 'Confirm Password',
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: skyblue,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomDropdownField(
                  label: 'Select Gender',
                  items: ['Male', 'Female', 'Other'],
                  dropdownIconImage: arrow_down,
                  onChanged: (value) {},
                ),
              ),

              SizedBox(height: 33.h),
              CustomButton(text: 'Continue',textColor: skyblue, onPressed: (){},color: Colors.white,width: 311.w,),
              SizedBox(height: 14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By signing up you agree to our ',
                        style: TextStyle(fontSize: 14.sp, color: black),
                      ),
                      TextSpan(
                        text: 'Terms of Services',
                        style: TextStyle(fontSize: 14.sp, color: backgroundColor, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(fontSize: 14.sp, color: black),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
