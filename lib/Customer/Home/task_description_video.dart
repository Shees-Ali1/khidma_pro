import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';
import 'package:khidma_pro/techForm/chatScreenDetail.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_bar/CustomAppBar.dart';
import '../../consts/text_styles.dart';
import '../../drawer/CustomDrawer.dart';
import '../../widgets/cancel_dialog_box.dart';
import '../../widgets/smallContainers.dart';

class TaskDescription_video extends StatefulWidget {
  const TaskDescription_video({super.key, });

  @override
  State<TaskDescription_video> createState() => _TaskDescription_videoState();
}

class _TaskDescription_videoState extends State<TaskDescription_video> {
  String formattedDate = "";
  String formattedTime = "";

  @override
  void initState() {
    super.initState();
    getFormattedTime();
  }

  void getFormattedTime() {
    // Static date and time for demonstration
    String combinedDateTime = '2023-10-01 14:30:00';
    DateTime parsedDateTime = DateTime.parse(combinedDateTime);

    formattedDate = DateFormat('EEE, MMM d, y').format(parsedDateTime);
    formattedTime = DateFormat('h:mm a').format(parsedDateTime);
  }

  void _openGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw "Could not open Google Maps";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Static data for demonstration
    final String title = "House Cleaning";
    final String status = "In Progress";
    final String name = "John Doe";
    final String description = "The pipe under the kitchen sink is leaking and needs to be fixed.";
    final String city = "New York";
    final String Area = "Manhattan";
    final String Building = "123";
    final String House = "Apt 4B";
    final double latitude = 40.7128;
    final double longitude = -74.0060;
    final String voiceNoteUrl = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    final List<String> imageUrls = [
      "https://via.placeholder.com/150",
      "https://via.placeholder.com/150",
    ];
    final List<String> videoUrl = [
      "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
    ];

    return Scaffold(

      appBar: const CustomAppBar(
        title: 'Task Description', // Title of the app
        showDrawer: false, // Show drawer icon (true/false)
        showBackArrow: true, // Show back arrow if needed (true/false)
        showNotificationsIcon: false, // Show notifications icon (true/false)
        showSettingsIcon: false, // Show settings icon (true/false)
      ),
      drawer: const CustomDrawer(), // Use the custom drawer here
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                title,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold,color: skyblue),
              ),
              SizedBox(height: 9.h),
              Container(
                padding: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: skyblue,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.5.r),
                            ),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(fontSize: 11.sp, color: Colors.black),
                          ),
                        ),
                        Text('ID # 2145',style: jost500(11.sp, whiteColor),),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.5.r),
                            ),
                          ),
                          child: Text(
                            "House Cleaning",
                            style: TextStyle(fontSize: 11.sp, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold,color: whiteColor),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 15,color: whiteColor,),
                                    SizedBox(width: 3.w),
                                    Text(
                                      city,
                                      style: jost300(11.sp, whiteColor),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  description,
                                  style: jost300(11.sp, whiteColor)
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 110.h,
                            width: 85.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.w),
                              image: DecorationImage(
                                image: AssetImage(calendar),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 35.h,
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 16.h ,
                                          width: 16.w,
                                          child: Image.asset(calendar)),
                                      SizedBox(width: 10.w,),
                                      Text(
                                        "Mon, Dec 23 ",
                                        style: TextStyle(fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 18.h ,
                                          width: 18.w,
                                          child: Image.asset(clock)),
                                      SizedBox(width: 5.w,),
                                      Text(
                                        "12:00",
                                        style: TextStyle(fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),



                    SizedBox(height: 5.h),
                    // Video Player Placeholder
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 189.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          "Video Player Placeholder",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    // Voice Note Placeholder
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: Text(
                          "Voice Note Placeholder",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                ChatScreenDetail();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.w),
                                ),
                                child: Center(
                                  child: Text(
                                    "Chat",
                                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Handle Chat button press
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.w),
                                ),
                                child: Center(
                                  child: Text(
                                    "Track on map",
                                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _openGoogleMaps(latitude, longitude);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.w),
                                ),
                                child: Center(
                                  child: Text(
                                    "Reschedule",
                                    style: TextStyle(fontSize: 13.sp, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        onTap: (){
                         },
                        child: CustomSmallContainers(
                          text: 'Mark as Done',
                          height: 51.w,
                          textStyle: jost500(19.sp, whiteColor),
                        //  width: 150.w,
                        ),
                      )),
                  SizedBox(
                    width: 14.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: whiteColor,
                              contentPadding: EdgeInsets.zero,
                              content: CancelDialogBox(),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 51.w,
                      //  width: 150.w,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(241, 241, 241, 1),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                            child: Text(
                              'Cancel',
                              style: jost500(19.sp, skyblue),
                            )),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 26.h),
            ],
          ),
        ),
      ),
    );
  }
}