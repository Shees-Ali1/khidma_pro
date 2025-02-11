import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../consts/colors.dart';
import '../consts/text_styles.dart';
import 'buttons.dart';

class CancelDialogBox extends StatelessWidget {
  const CancelDialogBox({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController reason = TextEditingController();

    return Container(
      width: 250.w,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 32.h,),
            Text("Do you want to", style: jost600(24.sp, skyblue),),
            Text("Cancel?", style: jost700(32.sp, skyblue),),
            SizedBox(height: 12.h,),
            TextFormField(
              controller: reason,
              cursorColor: skyblue,
              maxLines: 6,
              style: jost400(15.sp, skyblue),
              decoration: InputDecoration(
                hintText: "Write your reason",
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
            SizedBox(height:17.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    width: 101.w,
                    height: 42.h,
                   textColor: whiteColor,
                  
                    onPressed: (){
                      Get.back();
                    }, text: 'Yes',
                  ),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: CustomButton(
                    width: 101.w,
                    height: 42.h,
                   color: Color.fromRGBO(241, 241, 241, 1),
                    onPressed: (){
                      Get.back();
                    }, text: 'No',
                    textColor: skyblue,
                  ),
                ),
              ],
            ),
            SizedBox(height:13.h),
          ],
        ),
      ),
    );
  }
}
