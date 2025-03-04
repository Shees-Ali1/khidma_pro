import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';  // Import GetX package
import 'package:khidma_pro/techForm/chatScreen.dart';
import '../Customer/Profile/userProfile.dart';
import '../Service-Provider/Bookings/booking_page.dart';
import '../Service-Provider/Home/home_page.dart';
import '../consts/colors.dart';
import '../consts/images.dart';
import '../consts/text_styles.dart';
import '../controllers/Service-Provider-Controller/Ui-Controllers/BottomBarController.dart';
import '../pro_Profile.dart';


class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final BottomBarController controller = Get.put(BottomBarController());

    final List<Widget> screens = [
       HomePage(),
       BookingPage(),
       ChatsScreenMain(),
       ProProfileScreen(),
    ];

    return Scaffold(
      body: Obx(() {
        // Use Obx to make the screen change reactively based on currentIndex
        return screens[controller.currentIndex.value];
      }),
      bottomNavigationBar: Obx(() {
        // Reactive Bottom Navigation Bar
        return CircleNavBar(
          activeIndex: controller.currentIndex.value,
          activeIcons: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(home, width: 22.w, height: 22.h, color: backgroundColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(booking, width: 22.w, height: 22.h, color: backgroundColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(chat, width: 22.w, height: 22.h, color: backgroundColor),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(profile, width: 22.w, height: 22.h, color: backgroundColor),
            ),
          ],
          inactiveIcons: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(home, width: 28.w, height: 28.h, color: backgroundColor),
                SizedBox(height: 8.87.h),
                Text(
                  "Home",
                  style: TextStyles.bottomNavText(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(booking, width: 28.w, height: 28.h, color: backgroundColor),
                SizedBox(height: 8.87.h),
                Text(
                  "Booking",
                  style: TextStyles.bottomNavText(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(chat, width: 28.w, height: 28.h, color: backgroundColor),
                SizedBox(height: 8.87.h),
                Text(
                  "Chat",
                  style: TextStyles.bottomNavText(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(profile, width: 28.w, height: 28.h, color: backgroundColor),
                SizedBox(height: 8.87.h),
                Text(
                  "Profile",
                  style: TextStyles.bottomNavText(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
          color: Colors.white,
          circleColor: Colors.white,
          height: 60,
          circleWidth: 50,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          shadowColor: Colors.white,
          circleShadowColor: Colors.white,
          elevation: 10,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [skyblue, skyblue],
          ),
          circleGradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [skyblue, skyblue],
          ),
          onTap: (index) {
            // Use controller to update the index instead of setState
            controller.updateIndex(index);
          },
        );
      }),
    );
  }
}
// Screens for Navigation






