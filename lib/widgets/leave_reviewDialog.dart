import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/Customer/Home/wallet_screen.dart';

import '../consts/colors.dart';
import '../consts/text_styles.dart';
import 'buttons.dart';

class LeaveReviewDialog extends StatelessWidget {
  const LeaveReviewDialog({super.key});

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
            Text("Leave a Review", style: jost600(24.sp, skyblue),),
            SizedBox(height: 12.h,),
            Container(

              padding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: skyblue,
                borderRadius: BorderRadius.circular(22.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      4,
                          (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Icon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.yellowAccent,
                          size: 20.w,
                        ),
                      ),
                    )..add(
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: Icon(
                          FontAwesomeIcons.star,
                          color: Colors.yellowAccent,
                          size: 20.w,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text('4 out of 5', style: jost500(9.sp, whiteColor)),

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height:17.h),

            TextFormField(
              controller: reason,
              cursorColor: skyblue,
              maxLines: 6,
              style: jost400(15.sp, skyblue),
              decoration: InputDecoration(
                hintText: "Write your comments",
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
                      Get.to(WalletScreen());
                    }, text: 'Done',
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
                    }, text: 'Cancel',
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
