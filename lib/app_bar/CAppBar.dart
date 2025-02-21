import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';

import '../consts/images.dart';


class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar({
    super.key,
    required this.isMenu,
    required this.isNotification,
    required this.isTitle,
    this.title,
    required this.isSecondIcon,
    this.onBackTap,
    this.onMenuTap,
    this.isTextField = false,
    this.secondIcon,
    this.onSecondTap,
    this.onNotificationTap,
  });

  final bool isMenu;
  final bool isNotification;
  final bool isSecondIcon;
  final bool isTitle;
  final bool isTextField;
  final String? title;
  final String? secondIcon;
  final VoidCallback? onBackTap;
  final VoidCallback? onMenuTap;
  final VoidCallback? onSecondTap;
  final VoidCallback? onNotificationTap;

  @override
  Size get preferredSize => Size.fromHeight(130.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      padding: EdgeInsets.only(left: 13.w, right: 19.w, bottom: 10.h, top: 40.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.w),
          bottomRight: Radius.circular(15.w),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18), // Adjust opacity if needed
            offset: const Offset(0, 4), // (x = 0, y = 4)
            blurRadius: 10.4, // blur 10.4
            spreadRadius: 0, // spread 0
          ),
        ],
      ),
      child: Row(
        children: [
          // Menu or Back Button
          Container(
            padding: const EdgeInsets.all(5.0),
            width: 38.w,
            height: 38.h,
            decoration: BoxDecoration(
              color: skyblue,
              shape: BoxShape.circle,
            ),
            child: isMenu
                ? Icon(Icons.menu, color: backgroundColor, size: 24.h) // Hamburger menu
                : GestureDetector(
                 onTap: (){
                   Get.back();
                 },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                                  back_arrow,
                                  color: backgroundColor,
                                  height: 24.h,  // Adjust the height if needed
                                  width: 24.h,
                                ),
                  ),
                ), // Back arrow image
          ),




          // Title or Search Field
          if (isTitle == true || isTextField == true)
            SizedBox(width: 12.w),
          if (isTitle == true && isTextField == false)
            Expanded(
              child: Text(
                title ?? "",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600, color: skyblue),
              ),
            ),
          if (isTextField == true && isTitle == false)
            Container(
              width: 190.w,
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade300, // Set the background color
                borderRadius: BorderRadius.circular(15.w), // Rounded edges
              ),
              child: Row(
                children: [
                  Icon(Icons.search, size: 19.2.h,),
                  SizedBox(width: 10.w), // Space between the icon and the text field
                  Expanded(
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 9.h),
                        hintText: "Search for anything",
                        border: InputBorder.none, // Remove the underline border
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Spacer to push the icons to the end
          Spacer(),

          // Second Icon
          if (isSecondIcon == true)
            GestureDetector(
              onTap: onSecondTap,
              child: Icon(Icons.settings, size: 38.h,),
            ),

          // Notification Icon with Green Dot
          if (isNotification == true)
            GestureDetector(
              onTap: onNotificationTap,
              child: Container(
                margin: EdgeInsets.only(
                    left: isSecondIcon == true ? 7.w : 0),
                height: 38.h,
                width: 35.w,
                decoration: BoxDecoration(
                  color: skyblue,
                  borderRadius: BorderRadius.circular(14.w),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.settings, size: 23.h,color: whiteColor,),
              ),
            ),
        ],
      ),
    );
  }
}