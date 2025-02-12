import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showDrawer;
  final bool showBackArrow;
  final bool showNotificationsIcon; // Boolean for showing notifications icon
  final bool showSettingsIcon; // Boolean for showing settings icon
  final String title;

  const CustomAppBar({
    Key? key,
    this.showDrawer = false,
    this.showBackArrow = false,
    this.showNotificationsIcon = false, // Default to false, so icon isn't shown
    this.showSettingsIcon = false, // Default to false, so icon isn't shown
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top), // Add padding for status bar
      decoration: BoxDecoration(
        color: backgroundColor, // Customize the background color
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18), // Shadow for the top part
            offset: const Offset(0, 4),
            blurRadius: 10.4,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.w), // Radius for bottom left
          bottomRight: Radius.circular(15.w), // Radius for bottom right
        ),
      ),
      child: Column(
        children: [
          // Row containing the app bar title and icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showDrawer)
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer(); // Open the drawer when tapped
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 38.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: skyblue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.menu, color: backgroundColor), // Hamburger menu icon (3 bars)
                    ),
                  ),
                )
              else if (showBackArrow)
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),

                      width: 38.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: skyblue,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(back_arrow, color: backgroundColor), // Hamburger menu icon (3 bars)
                    ),
                  ),
                ),
              Text(
                title, // Title of the AppBar
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: skyblue,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Conditionally show right-side icons
                  if (showNotificationsIcon)
                    Container(
                      width: 35.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: skyblue,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(wallet),
                        ),
                      ),
                    ),
                  SizedBox(width: 10.w),
                  if (showSettingsIcon)
                    Container(
                      width: 35.w,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: skyblue,
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(notification),
                        ),
                      ),
                    ),
                  SizedBox(width: 15.w),
                ],
              ),
            ],
          ),
          // Bottom container with shadow

        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h); // Set custom height
}
