import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/widgets/promoBottomSheet.dart';

import '../consts/colors.dart';
import '../consts/images.dart';
import '../consts/text_styles.dart';

class PaymentBottomsheet extends StatefulWidget {
  const PaymentBottomsheet({super.key});

  @override
  State<PaymentBottomsheet> createState() => _PaymentBottomsheetState();
}

class _PaymentBottomsheetState extends State<PaymentBottomsheet> {
  // Define a service fee percentage (e.g., 2%)
  final double serviceFeePercentage = 2.0;
  final double price = 100.0; // Static price value

  double get serviceFee {
    return (price * serviceFeePercentage) / 100;
  }

  double get totalAmount {
    return price + serviceFee;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.w),
          topRight: Radius.circular(40.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 26.h),
            Container(
              width:200.w ,
              height: 111.h,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 0.w),
              decoration: BoxDecoration(
                color: skyblue,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child:


                  Center(
                    child: Text(
                      "\$79.00",
                      style: GoogleFonts.inter(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w700,
                        color: whiteColor,
                      ),
                    ),
                  ),


            ),

            SizedBox(height: 30.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Select payment Method.",
                style: jost600(24.sp, skyblue),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30.h),
            _buildPaymentOption(walletFill, 'Pay via Wallet'),
            _buildPaymentOption(walletFill, 'Pay via Card'),
            _buildPaymentOption(apple, 'Apple Pay'),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.bottomSheet(
                  PromoBottomsheet(),
                  isScrollControlled: true,
                  isDismissible: true,
                  enableDrag: true,
                );
              },
              child: Text(
                "Use a promo Code",
                style: GoogleFonts.jost(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w500,
                  color: skyblue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 29.h),
          ],
        ),
      ),
    );
  }


  Widget _buildPaymentOption(String assetPath, String label) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
      decoration: BoxDecoration(
        color: skyblue,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(assetPath, width: 21.w, height: 21.h,color: whiteColor,),
          SizedBox(width: 80.w),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
