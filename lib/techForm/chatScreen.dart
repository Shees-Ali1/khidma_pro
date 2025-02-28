import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/app_bar/CustomAppBar.dart';
import 'package:khidma_pro/consts/colors.dart';

import '../notifications.dart';
import 'chat_Item.dart';

class ChatsScreenMain extends StatelessWidget {
  const ChatsScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
//    final NavBarController navBarController = Get.find<NavBarController>();

    return Scaffold(
     appBar: CustomAppBar(showDrawer: true,showNotificationsIcon: true,title: '',        onNotificationsTap: () => Get.to(Notifications()),
     ),
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 21.0.h, horizontal: 14.0.w), // Reduced vertical padding
          child: Column(
            children: [
              /// Search Bar
              Container(
                width: double.infinity,
                height: 50.h, // Height of the search bar
                decoration: BoxDecoration(
                  color: skyblue, // Background color
                  borderRadius: BorderRadius.circular(20.r), // Border radius
                ),
                child: TextField(
                  style: TextStyle(color: skyblue), // Text color inside the search field
                  decoration: InputDecoration(
                    hintText: 'Search', // Placeholder text
                    hintStyle: TextStyle(color: whiteColor,fontSize: 16.sp,fontWeight: FontWeight.w400,), // Color for hint text
                    prefixIcon: Icon(
                      Icons.search, // Prefix icon
                      color: whiteColor, // Prefix icon color
                    ),
                    filled: true, // Enable fill color
                    fillColor: skyblue, // Set the fill color explicitly
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none, // Remove border side
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0), // Vertical padding
                  ),
                ),
              ),
              SizedBox(height: 27.h),
              /// Chat List
              Expanded(
                child: ChatList(), // Ensure ChatList is properly defined
              ),
            ],
          ),
        ),
      ),
    );
  }
}


