import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:khidma_pro/Customer/Home/task_description_video.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/text_styles.dart';

import '../Service-Provider/DetailedServiceScreen/DetailedCard.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controller instance

    return Center(
      child: Container(
        width: 333.w,
        decoration: BoxDecoration(
            color: skyblue, borderRadius: BorderRadius.circular(12.r)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///* TOP RIGHT LEFT
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 108.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                        color: ServiceCardgrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          bottomRight: Radius.circular(12.r),
                        )),
                    child: Center(
                      child: Text(
                        "New",
                        style: TextStyles.serviceCardHead(),
                      ),
                    ),
                  ),
                  Container(
                    width: 108.w,
                    height: 21.h,
                    decoration: BoxDecoration(
                        color: ServiceCardgrey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                          bottomLeft: Radius.circular(12.r),
                        )),
                    child: Center(
                      child: Text(
                        "Office Cleaning",
                        style: TextStyles.serviceCardHead(),
                      ),
                    ),
                  )
                ],
              ),
          
              ///* USer name
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///* USer NAME & ID
                        Row(
                          children: [
                            Text(
                              "Jared Hughs",
                              style: jost700(16,
                                  backgroundColor), // Adjust the font size and color as needed
                            ),
                            SizedBox(
                              width: 26.w,
                            ),
                            Text(
                              "ID # 2145",
                              style: jost700(16,
                                  backgroundColor), // Adjust the font size and color as needed
                            ),
                          ],
                        ),
          
                        SizedBox(
                          height: 8.h,
                        ),
          
                        ///* LOCAtion
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 19.h,
                              color: backgroundColor,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "Downtown Road, Dubai.",
                              style: TextStyles.serviceCardLocation(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
          
                        ///* Description
                        SizedBox(
                            width: 200.w,
                            child: Text(
                              "I need to have my outdoor pipes fixed. We have a huge leakage in the valves and the wall fittings.",
                              style: TextStyles.serviceCardDescription(),
                            ))
                      ],
                    ),
                    Image.asset('assets/images/Service.png')
                  ],
                ),
              ),
          
              ///* DATE TIME & VIEW
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 199.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.date_range,
                                  color: skyblue,
                                  size: 14.46.h,
                                ),
                                SizedBox(
                                  width: 7.23.w,
                                ),
                                Text(
                                  "Mon, Dec 23",
                                  style: TextStyles.serviceCardHead(),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  color: skyblue,
                                  size: 14.46.h,
                                ),
                                SizedBox(
                                  width: 7.23.w,
                                ),
                                Text(
                                  "12:00",
                                  style: TextStyles.serviceCardHead(),
                                )
                              ],
                            )
                          ],
                        )),
                    GestureDetector(
                      onTap: (){
                        Get.to(DetailedCard(isInProgress: false,));
                      },
                      child: Container(
                        width: 98.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Center(
                          child: Text(
                            "View",
                            style: jost600(14, skyblue),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
