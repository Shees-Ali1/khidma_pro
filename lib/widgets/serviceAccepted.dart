import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/widgets/buttons.dart';
import 'package:khidma_pro/widgets/paymentBottomSheet.dart';

import '../consts/text_styles.dart';

class JobAcceptedBottomsheet extends StatefulWidget {
  const JobAcceptedBottomsheet({super.key, });



  @override
  State<JobAcceptedBottomsheet> createState() => _JobAcceptedBottomsheetState();
}

class _JobAcceptedBottomsheetState extends State<JobAcceptedBottomsheet> {
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
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20.h,),
            SizedBox(height: 21.h,),


            Text("Service Accepted", style: jost600(32.sp, skyblue
            ),),
            SizedBox(height: 20.h,),
            Align(
              alignment: Alignment.center,
              child: Text("Your Request has been successfully accepted with Natalie Hales. ", style: jost600(16.sp, skyblue), textAlign: TextAlign.center,),
            ),
            SizedBox(height: 20.h,),
            Align(
              alignment: Alignment.center,
              child: Text("Please continue to payment ", style: jost600(16.sp, skyblue),),
            ),
            SizedBox(height: 35.h,),
            CustomButton(
              width: 311.w,
              text: "Pay",
              fontSize: 16.sp,
              onPressed: (){
                Get.back();
                Get.bottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    enableDrag: true,
                    PaymentBottomsheet()
                );

              },
            ),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }
}
