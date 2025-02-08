import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/text_styles.dart';

class Availability extends StatelessWidget {
  const Availability({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: 333.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: announcementMainContainer,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 2,
            color: announcementMainContainerBorder
          )

        ),

child: Center(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("Availability",
      style: TextStyles.availability(),
      )
    ],
  ),
),
      ),
    );
  }
}
