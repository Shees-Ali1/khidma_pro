import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/Get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/consts/colors.dart';

import '../../../consts/text_styles.dart';

class CustomerBidBottomSheet extends StatelessWidget {
  const CustomerBidBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.w),
          topRight: Radius.circular(40.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.h),
            Text(
              "Customer Bid",
              style: jost600(32.sp, skyblue),
            ),
            SizedBox(height: 38.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 50.w),
              decoration: BoxDecoration(
                color: skyblue,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    "50.00",
                    style: GoogleFonts.inter(
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                    ),
                  ),
                  Text(
                    "AED",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 29.h),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter new bid amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: skyblue,
                foregroundColor: whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                textStyle: jost500(16.sp, whiteColor),
                minimumSize: Size(155.w, 0), // Reasonable width for submit button
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text("Submit"),
            ),
            SizedBox(height: 29.h),
          ],
        ),
      ),
    );
  }
}