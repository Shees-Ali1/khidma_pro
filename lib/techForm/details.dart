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

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final TextEditingController bio = TextEditingController();

  final TechController techController = Get.find();
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Write a short bio about yourself',
              style: jost600(15.17.sp, greyColor),
            ),
          ),
          SizedBox(height: 56.h),

          TextFormField(
            controller: bio,
            cursorColor: skyblue,
            maxLines: 6,
            style: jost400(15.sp, skyblue),
            decoration: InputDecoration(
              hintText: "Write Description",
              hintStyle: jost400(16.sp, skyblue),
              fillColor: textfieldColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.31.r),
                borderSide: BorderSide(color: textfieldBorder, width: 0.95.w),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textfieldBorder, width: 0.95.w),
                borderRadius: BorderRadius.circular(13.31.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: textfieldBorder, width: 0.95.w),
                borderRadius: BorderRadius.circular(13.31.r),
              ),
            ),
          ),
          SizedBox(height: 19.w),

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
