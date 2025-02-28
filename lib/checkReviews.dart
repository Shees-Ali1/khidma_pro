import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/widgets/MyPopupMenuButton.dart';
import 'package:khidma_pro/widgets/cancel_dialog_box.dart';
import 'package:khidma_pro/widgets/serviceAccepted.dart';
import 'package:khidma_pro/widgets/smallContainers.dart';

import 'app_bar/CAppBar.dart';
import 'consts/colors.dart';
import 'consts/images.dart';
import 'consts/text_styles.dart';

class CheckReviews extends StatefulWidget {
  const CheckReviews({super.key});

  @override
  State<CheckReviews> createState() => _CheckReviewsState();
}

class _CheckReviewsState extends State<CheckReviews> {
  final Map<String, List<Map<String, String>>> reviewsData = {
    "5 stars": [
      {
        "name": "Ryosuke Tanaka",
        "date": "August 5, 2023",
        "comment":
        "Natalie offers an impressive array of features and resources, making it a truly awesome tool for learning, fantastic choice for anyone looking to enhance their learning journey.",
      },
      {
        "name": "John Doe",
        "date": "July 12, 2023",
        "comment": "Amazing platform with great learning tools!",
      },
    ],
  };
  final RxString selectedOption = '5 stars'.obs; // Default selected option
  final List<String> options = ['5 stars', '4 stars', '3 stars', '2 stars', '1 star'];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CAppBar(
          isMenu: false,
          isNotification: false,
          isTitle: true,
          title: 'Reviews',
          isSecondIcon: false,
          onBackTap: () {
            Get.back();
          },
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 24.h),
                // DropdownWidget(isEnabled: true,),
                SizedBox(height: 26.h),
                Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: skyblue,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          4,
                              (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.yellowAccent,
                              size: 30.w,
                            ),
                          ),
                        )..add(
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Icon(
                              FontAwesomeIcons.star,
                              color: Colors.yellowAccent,
                              size: 30.w,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text('4 out of 5', style: jost500(14.sp, whiteColor)),
                          Text('1 reviews', style: jost500(14.sp, whiteColor)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Obx(() => Container(
                  height: 26.h,
                  width: 87.w,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: skyblue,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedOption.value,
                      dropdownColor: skyblue,
                      icon: Icon(Icons.keyboard_arrow_down, color: Colors.white,size: 20,),
                      style: TextStyle(color: Colors.white), // Text color of selected item
                      onChanged: (newValue) {
                        if (newValue != null) {
                          selectedOption.value = newValue;
                        }
                      },
                      items: options.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(option, style: jost400(11.sp, whiteColor)),
                        );
                      }).toList(),
                    ),
                  ),
                )),
                SizedBox(height: 20.h),


                Column(
                  children: reviewsData["5 stars"]!.map((review) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15.h),
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20.w,
                                backgroundImage: AssetImage(
                                    "assets/images/review_coments_image.png"),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(review['name']!,
                                      style: jost700(13.23.sp, skyblue)),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                          5,
                                              (index) => Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            child: Icon(
                                              FontAwesomeIcons.solidStar,
                                              color: Colors.yellowAccent,
                                              size: 16.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(review['date']!,
                                          style: jost500(12.sp, skyblue)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Text(review['comment']!,
                              style: jost500(13.sp, skyblue)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 12.h,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
