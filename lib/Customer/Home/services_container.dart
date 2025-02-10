import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khidma_pro/consts/colors.dart';

import '../../authentication/role_screen.dart';


class ServicesContainer extends StatelessWidget {
  const ServicesContainer({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.79.h),
      width: 163.12.w,
      height: 150.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image), // Local Image only
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 140.w,
        height: 36.04.h,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: jost700(12.sp, black),
        ),
      ),
    );
  }
}
