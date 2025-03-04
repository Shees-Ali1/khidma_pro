import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/Customer/Home/wallet_screen.dart';
import 'package:khidma_pro/checkReviews.dart';
import 'package:khidma_pro/techForm/main_techForm.dart';
import '../../app_bar/CAppBar.dart';
import '../../authentication/role_screen.dart';
import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../consts/text_styles.dart';
import '../../editProfileScreeen.dart';


class ProProfileScreen extends StatefulWidget {
  const ProProfileScreen({super.key});

  @override
  _ProProfileScreenState createState() => _ProProfileScreenState();
}

class _ProProfileScreenState extends State<ProProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus();
      },
      child: Scaffold(

        appBar: CAppBar(
          onNotificationTap: () {
          },
          onMenuTap: () {
          },
          isMenu: true,
          isNotification: true,
          isTitle: true,
          title: 'Profile',
          isSecondIcon: false,
          // secondIcon: AppSvgs.notification,
        ),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 14.h),

              /// Profile Image
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 138.w,
                  child: SizedBox(
                    height: 120.h,
                    width: 120.w,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(profile_image),
                      radius: 60, // Optional: customize radius if needed
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h,),
              Text(
                "Merrill Kervin",
                style: jost700(23.1.sp,skyblue),
              ),
              SizedBox(height: 30.h),

              /// My Profile
              ProfileButton(
                onPressed: () {
                  // Navigate to the EditProfileScreen
                  Get.to(EditProfileScreen());
                },
                label: "My Profile",
                iconPath: user,
              ),

              SizedBox(height: 10.h),

              /// Bio and Experience
              ProfileButton(
                onPressed: () {
                  Get.to(MainTechForm());
                },
                label: "Bio and Experience",
                iconPath: walletFill,
              ),
              SizedBox(height: 10.h),

              ProfileButton(
                onPressed: () {
                  Get.to(CheckReviews());
                },
                label: "Reviews",
                iconPath:star ,
              ),
              SizedBox(height: 10.h),

              /// Reviews
              ProfileButton(
                onPressed: () {
                  //       Get.to(ReviewsScreen());
                },
                label: "Reports",
                iconPath: reports,
              ),
              SizedBox(height: 10.h),

              ProfileButton(
                onPressed: () {
                  //          Get.to(TermsCondition());
                },
                label: "Terms/Policy",
                iconPath: helpsupport,
              ),

              SizedBox(height: 10.h),

              ProfileButton(
                onPressed: () {
                  //          Get.to(TermsCondition());
                },
                label: "Help/Contact Us",
                iconPath: helpsupport,
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  Get.offAll(RoleScreen());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Row(
                    children: [
                      Image.asset(
                        logout,
                        height: 25.h,
                        width: 25.w,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        'Logout',
                        style: jost500(16.sp,skyblue),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfileButton extends StatefulWidget {
  final VoidCallback onPressed; // Required onPressed callback
  final String label; // Required label text
  final String iconPath; // Required icon path

  // Constructor with required parameters
  const ProfileButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.iconPath,
  }) : super(key: key);

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed, // Call the provided onPressed function
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent, // No background color
        padding: EdgeInsets.zero, // Remove default padding
        minimumSize: Size(double.infinity, 52.h), // Set height
        shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(13.31.r), // Border radius
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.iconPath, // Use the passed icon asset path
                  height: 22.54.h, // Set your desired height
                  width: 25.54.w, // Set your desired width
                ),
                SizedBox(width: 20.39.h),
                // Use a fixed color for the text
                Text(
                  widget.label, // Use the passed label text
                  style: jost500(
                    16.sp,
                    skyblue, // Fixed color, no state-based change
                  ),
                ),
              ],
            ),
            Image.asset(
              profile_arrow, // Use the image asset path
              height: 14.62.h, // Set your desired height
              width: 24.85.w, // Set your desired width
            ),
          ],
        ),
      ),
    );
  }
}
