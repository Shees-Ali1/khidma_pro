import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/images.dart';
import 'package:khidma_pro/widgets/smallContainers.dart';

import '../app_bar/CAppBar.dart';
import '../consts/colors.dart';
import '../consts/text_styles.dart';
import '../widgets/cancel_dialog_box.dart';
import '../widgets/paymentBottomSheet.dart';
import '../widgets/serviceAccepted.dart';

class TechReviews extends StatefulWidget {
  const TechReviews({super.key});

  @override
  _TechReviewsState createState() => _TechReviewsState();
}

class _TechReviewsState extends State<TechReviews> {
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
          title: 'Natalie Hales',
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
                SizedBox(height: 24.h),
                Row(
                  children: [
                    SizedBox(
                        height: 76.h, width: 90.w, child: Image.asset(tech_2)),
                    SizedBox(width: 9.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Natalie Hales', style: jost600(16.sp, skyblue)),
                        SizedBox(height: 5.h),
                        Text('10+ years of experience in cleaning',
                            style: jost500(10.sp, skyblue)),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Text('200', style: jost600(24.sp, skyblue)),
                            Text('AED', style: jost400(13.sp, skyblue)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          enableDrag: true,
                          JobAcceptedBottomsheet(
                          ),
                        );
                      },
                      child: CustomSmallContainers(
                        text: 'Accept',
                        height: 56.w,
                        textStyle: jost600(22.sp, whiteColor),
                        width: 150.w,
                      ),
                    )),
                    SizedBox(
                      width: 14.w,
                    ),
                    GestureDetector(
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
                        height: 56.w,
                        width: 150.w,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(241, 241, 241, 1),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                            child: Text(
                          'Cancel',
                          style: jost600(22.sp, skyblue),
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
