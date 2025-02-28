import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';
import '../Customer/Home/wallet_screen.dart';
import '../consts/text_styles.dart';
import '../notifications.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showDrawer;
  final bool showBackArrow;
  final bool showNotificationsIcon;
  final bool showSettingsIcon;
  final bool walleticon;
  final bool searchfield;
  final String title;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onWalletTap;

  const CustomAppBar({
    Key? key,
    this.showDrawer = false,
    this.showBackArrow = false,
    this.searchfield = false,
    this.showNotificationsIcon = false,
    this.showSettingsIcon = false,
    this.walleticon = false,
    required this.title,
    this.onNotificationsTap,
    this.onWalletTap,
  })  : assert(
  !showNotificationsIcon || onNotificationsTap != Icons.question_mark_sharp,
  'onNotificationsTap must be provided when showNotificationsIcon is true',
  ),
        super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                      onTap: () {
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
                          child: Image.asset(back_arrow, color: backgroundColor), // Back arrow icon
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (searchfield) // Fixed the condition to show search field when true
                    Container(
                      width: 180.w,
                      height: 40.h,
                      padding: EdgeInsets.symmetric(horizontal: 13.w),
                      decoration: BoxDecoration(
                        color: skyblue, // Set the background color
                        borderRadius: BorderRadius.circular(15.w), // Rounded edges
                      ),
                      child: Row(
                        children: [
                          Image.asset(search, color: Colors.white, height: 20.h, width: 20.w),
                          SizedBox(width: 10.w), // Space between the icon and the text field
                          Expanded(
                            child: TextField(
                              cursorColor: whiteColor,
                              style: jost400(14.sp, Colors.white),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 9.h),
                                hintText: "Search for anything",
                                hintStyle: jost400(13.sp, Colors.white),
                                border: InputBorder.none, // Remove the underline border
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(width: 10.w),
                  if (walleticon)
                    GestureDetector(
                      onTap: onWalletTap,
                      child: Container(
                        width: 35.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: skyblue,
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(wallet), // Consider using a settings icon here if intended
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: 15.w),
                  // Conditionally show right-side icons
                  if (showNotificationsIcon)
                    GestureDetector(
                      onTap: onNotificationsTap,
                      child: Container(
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
                          child: Image.asset(notification), // Consider using a settings icon here if intended
                        ),
                      ),
                    ),
                  SizedBox(width: 15.w),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h); // Set custom height
}