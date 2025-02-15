import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/app_bar/CAppBar.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';

import '../consts/text_styles.dart';

class ProWallet extends StatelessWidget {
  const ProWallet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        isMenu: false,
        isNotification: false,
        isTitle: true,
        title: 'Wallet',
        isSecondIcon: false,
        onBackTap: () {
          Get.back();
          // Get.back();
        },
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: skyblue, width: 1.w),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    height: 85.h,
                    width: 101.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          12.r), // Apply border radius to the image
                      child: Image.asset(

                         bankImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ADCB', style: jost600(14.sp, black)),
                      Text(
                        "Muhammad Ali",
                        style: jost600(19.sp, black),
                      ),
                      Text(
                        "AE07 0331 2345 6789 0123 456",
                        style: jost600(11.sp, black),
                      ),
                      Text(
                        "1234567890123456",
                        style: jost600(12.sp, black),
                      ),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      //  Get.to(Wallet());
                    },
                    child: Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: skyblue,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(pencil),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(31.w, 17.h, 31.w, 0),
                height: 101.h,
                width: 350.w,
                decoration: BoxDecoration(
                    color: skyblue, borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total",
                          style: jost600(14.sp, whiteColor),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "79.00",
                          style: jost700(18.sp, whiteColor),
                        ),
                        Text(
                          "AED",
                          style: jost600(14.sp, whiteColor),
                        ),
                      ],
                    ),
                    Container(
                      width: 2.w,
                      height: 111.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF000000), // Black color at the start
                            Color(0xFFFFFFFF), // White color in the middle
                            Color(0xFF000000), // Black color at the end
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.505, 1.0],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Pending",
                          style: jost600(14.sp, whiteColor),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "79.00",
                          style: jost700(18.sp, whiteColor),
                        ),
                        Text(
                          "AED",
                          style: jost600(14.sp, whiteColor),
                        ),
                      ],
                    ),
                    Container(
                      width: 2.w,
                      height: 101.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF000000), // Black color at the start
                            Color(0xFFFFFFFF), // White color in the middle
                            Color(0xFF000000), // Black color at the end
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.505, 1.0],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Available",
                          style: jost600(14.sp, whiteColor),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "79.00",
                          style: jost700(18.sp, whiteColor),
                        ),
                        Text(
                          "AED",
                          style: jost600(14.sp, whiteColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),

              Center(
                child: Container(
                  height: 61.h,
                  width: 304.w,
                  decoration: BoxDecoration(
                    color: skyblue,
                    borderRadius: BorderRadius.circular(12.4.r),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 47.w), // Adjust padding as needed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceAround, // Spread items within the padding
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(withdraw, scale: 3),
                              SizedBox(height: 4.h),
                              Text("Withdraw", style: jost400(12.sp, whiteColor)),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              //      Get.to(WalletHistory());
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset("assets/images/history.png",
                                    scale: 3),
                                SizedBox(height: 4.h),
                                Text("History",
                                    style: jost400(12.sp, whiteColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Transactions",
                    style: jost600(26.sp, black),
                  )),
              SizedBox(
                height: 13.h,
              ),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Today",
                    style: jost400(13.sp, black),
                  )),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 28.1.w,
                        height: 28.1.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  arrow_downward),
                              scale: 4,
                            )),
                      ),
                      SizedBox(
                        width: 23.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Credit",
                            style: jost400(13.sp, black),
                          ),
                          Text(
                            "From Starbucks",
                            style: jost400(12.sp, black),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 37.0.w),
                    child: Text(
                      "\$ 3,110",
                      style: jost500(14.sp, black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 28.1.w,
                        height: 28.1.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  arrow_downward),
                              scale: 4,
                            )),
                      ),
                      SizedBox(
                        width: 23.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transfer",
                            style: jost400(13.sp, black),
                          ),
                          Text(
                            "To Starbucks",
                            style: jost400(12.sp, black),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 37.0.w),
                    child: Text(
                      "\$ 1,500",
                      style: jost500(14.sp, black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21.h,
              ),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Yesterday",
                    style: jost400(13.sp, black),
                  )),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 28.1.w,
                        height: 28.1.h,
                        decoration: BoxDecoration(
                            color: skyblue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                  arrow_downward),
                              scale: 4,
                            )),
                      ),
                      SizedBox(
                        width: 23.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Transfer",
                            style: jost400(13.sp, black),
                          ),
                          Text(
                            "To Starbucks",
                            style: jost400(12.sp, black),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 37.0.w),
                    child: Text(
                      "\$ 3,110",
                      style: jost400(14.sp, black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
