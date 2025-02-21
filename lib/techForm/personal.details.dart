import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/techForm/tech_controller.dart';
import 'package:khidma_pro/widgets/buttons.dart';

import '../authentication/role_screen.dart';
import '../consts/images.dart';
import '../consts/text_styles.dart';
import '../widgets/Custom_dropdown.dart';
import '../widgets/textfield.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TechController techController = Get.find();
  String? selectedGender;
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Enter Your Personal Details here.',
              style: jost600(15.17.sp, greyColor),
            ),
          ),
          SizedBox(height: 56.h),

          /// First Name and Last Name TextFields
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  contentPadding: EdgeInsets.symmetric(vertical: 1),
                  label: 'First Name',
                  labelTextSize: 13.sp,
                  controller: firstname,
                  prefixIcon: Icon(
                    Icons.person,
                    color: skyblue,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(width: 19.w),
              Expanded(
                child: CustomInputField(
                  contentPadding: EdgeInsets.symmetric(vertical: 1),

                  label: 'Last Name',
                  labelTextSize: 13.sp,
                  controller: lastname,
                  prefixIcon: Icon(
                    Icons.person,
                    color: skyblue,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.h),


          /// Email TextField
          CustomInputField(
            contentPadding: EdgeInsets.symmetric(vertical: 1),

            controller: email,
            label: 'Your email',
            prefixIcon: Icon(
              Icons.email,
              color: skyblue,
              size: 18.sp,
            ),
          ),
          SizedBox(height: 25.h),

          CustomInputField(
            contentPadding: EdgeInsets.symmetric(vertical: 1),

            controller: password,
            label: 'Your password',
            prefixIcon: Icon(
              Icons.lock,
              color: skyblue,
              size: 18.sp,
            ),
          ),
          SizedBox(height: 25.h),

          /// Gender Drop Down Field
          CustomDropdownField(
            contentPadding: EdgeInsets.symmetric(vertical: 1),

            label: 'Select Gender',
            items: const ['Male', 'Female', 'Other'],
            dropdownIconImage: arrow_down,
            onChanged: (value) {},
          ),

          SizedBox(height: 120.h),

          CustomButton(
            width: 311.w,
            text: 'Next',
            textColor: whiteColor,
            color: skyblue,
            onPressed: () {


              // Navigate by updating selectedIndex
           //   techController.selectedIndex.value = "1";
            },
          ),
        ],
      ),
    );
  }
}
