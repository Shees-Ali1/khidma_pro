import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';

import '../consts/images.dart';
import '../consts/text_styles.dart';

class ChatScreenDetail extends StatelessWidget {
  const ChatScreenDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h), // Set your preferred height here
        child: AppBar(
          automaticallyImplyLeading:
              false, // Prevents the default back button or title
          flexibleSpace: Container(
            height: 120.h,
            decoration: BoxDecoration(
              color: whiteColor, // Custom color
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.w),
                bottomRight: Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.18), // Adjust opacity if needed
                  offset: Offset(0, 4), // (x = 0, y = 4)
                  blurRadius: 10.4, // blur 10.4
                  spreadRadius: 0, // spread 0
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
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
                          SizedBox(width: 13.w),
                          Container(
                            height: 63.h,
                            width: 63.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                profile_image,
                                fit: BoxFit
                                    .cover, // Ensures the image fills the circle container
                              ),
                            ),
                          ),
                          SizedBox(width: 7.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'name',
                                style: jost600(
                                  22.sp,
                                  black,
                                ),
                              ),
                              Text(
                                'Plumber', // Placeholder text, you can update it as needed
                                style: jost400(
                                  16.sp,
                                  black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                            child: Image.asset(notification, color: backgroundColor), // Hamburger menu icon (3 bars)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          elevation: 0, // Remove AppBar shadow
          backgroundColor:
              Colors.transparent, // Makes the AppBar fully transparent
        ),
      ),
      backgroundColor: backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Dismiss the keyboard
        },
        child: Column(
          children: [
            // Add body content here if needed
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 25.h),
                children: [
                  _buildSupportMessage(
                      "Alright, \nYou can track your progress by accessing the 'My Courses' or 'My Progress' section in the app.\nIt will show you the courses you're enrolled in, your completion status, and any assessments or quizzes you've completed."),
                  _buildUserMessage("That's good to know.!"),
                  _buildUserMessage(
                      'Thank you so much for your help! I appreciate it.'),
                  _buildSupportMessage(
                      "You're very welcome!\nYou can track your progress by accessing the 'My Courses' or 'My Progress' section in the app."),
                  _buildSupportMessage("Happy studying"),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportMessage(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromRGBO(0, 26, 46, 1),
          child: Image.asset(profile_image),
        ),
        SizedBox(width: 10.w),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              color: skyblue, // Support bubble color
              borderRadius: BorderRadius.circular(5.69.r),
            ),
            child: Text(
              message,
              style: jost400(
                13.27.sp,
                whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserMessage(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 220.w, // Limit the message bubble width to 220
          ),
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.69.r),
                border: Border.all(color: black, width: 0.5)),
            child: Text(
              message,
              style: TextStyle(
                color: black,
                fontSize: 13.27.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMessageInput() {
    return Container(
      height: 79.8.h,
      width: double.infinity.w,
      color: skyblue,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.4.w),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 56.63.h, // Height for the container
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type message...',
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(100, 100, 100, 1)),
                    filled: true,
                    fillColor: backgroundColor,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide.none,
                    ),
                    isDense: true, // Set isDense to true
                  ),
                  style: TextStyle(color: skyblue),
                ),
              ),
            ),
            SizedBox(width: 11.52.w),
            Container(
              height: 38.4.h,
              width: 38.4.w,
              decoration: BoxDecoration(
                color: whiteColor, // Send button color
                shape: BoxShape.circle,
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 23.04.h,
                    width: 23.04.w,
                    child: Image.asset(send, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
