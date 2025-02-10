import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final String title = "Fix Leaking Pipe";
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Task Description'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                title,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 9.h),
              Container(
                padding: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.5.r),
                            ),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(fontSize: 11.sp, color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.5.r),
                            ),
                          ),
                          child: Text(
                            "Order #12345",
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
                                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 15),
                                    SizedBox(width: 3.w),
                                    Text(
                                      city,
                                      style: TextStyle(fontSize: 11.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  description,
                                  style: TextStyle(fontSize: 11.sp),
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
                                image: NetworkImage(imageUrls[0]),
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
                                children: [
                                  Text(
                                    "Service started at: ",
                                    style: TextStyle(fontSize: 11.sp),
                                  ),
                                  Text(
                                    "$formattedDate at $formattedTime",
                                    style: TextStyle(fontSize: 9.sp),
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
                                // Handle Call button press
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.w),
                                ),
                                child: Center(
                                  child: Text(
                                    "Call",
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
                                    "Location",
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle Mark as Done button press
                    },
                    child: Text("Mark as Done"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Cancel button press
                    },
                    child: Text("Cancel"),
                  ),
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