import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/Get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Service-Provider/tech_reviews.dart';
import '../../../consts/colors.dart';
import '../../../consts/images.dart';
import '../../../consts/text_styles.dart';
import '../../../widgets/serviceAccepted.dart';
import '../../../widgets/smallContainers.dart';
import 'BidBootomSheet.dart';

class OfferContainer extends StatelessWidget {
  const OfferContainer({super.key});

  // Static country code map for flags (kept for static flag display)
  static const Map<String, String> countryCodeMap = {
    "USA": "us",
    "Canada": "ca",
  };

  // Static price formatting function
  String formatPrice(String priceStr) {
    double price = double.tryParse(priceStr) ?? 0.0;
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(1)}k';
    } else {
      return price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: skyblue,
        borderRadius: BorderRadius.circular(12.w),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90.w,
            height: 100.h,
            margin: EdgeInsets.only(right: 9.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Image.asset(tech_2),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "John Doe",
                          style: jost600(16.sp, whiteColor),
                        ),
                        SizedBox(width: 10.w),
                        Image.network(
                          "https://flagcdn.com/w40/${countryCodeMap["USA"]?.toLowerCase() ?? 'us'}.png",
                          height: 20.h,
                          width: 30.w,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.flag,
                              color: greyColor,
                              size: 20.h,
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          star,
                          color: Colors.yellow,
                          height: 18.h,
                          width: 18.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "4.5",
                          style: jost600(14.sp, whiteColor),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          "(10)",
                          style: jost400(13.sp, greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Text(
                    "Experienced technician with a focus on quality.",
                    style: jost500(10.sp, whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: formatPrice("50"),
                            style: jost600(20.sp, whiteColor),
                          ),
                          TextSpan(
                            text: " AED",
                            style: jost400(13.sp, greyColor),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              const JobAcceptedBottomsheet(),
                              enableDrag: true,
                              isScrollControlled: true,
                              isDismissible: true,
                            );
                          },
                          child: CustomSmallContainers(
                            width: 60.w,
                            height: 27.h,
                            color: whiteColor, // This should now work
                            text: "Accept",
                            textStyle: jost500(13.sp, blackColor),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                              const CustomerBidBottomSheet(),
                              enableDrag: true,
                              isScrollControlled: true,
                              isDismissible: true,
                            );
                          },
                          child: CustomSmallContainers(
                            width: 60.w,
                            height: 27.h,
                            color: whiteColor, // This should now work
                            text: "Bid",
                            textStyle: jost500(13.sp, blackColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const TechReviews());
                      },
                      child: CustomSmallContainers(
                        width: 130.w,
                        height: 27.h,
                        color: whiteColor, // Changed to black
                        text: "View Profile",
                        textStyle: jost500(13.sp, blackColor), // Already white, kept as is
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}