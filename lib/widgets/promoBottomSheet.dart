import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/widgets/buttons.dart';
import 'package:khidma_pro/widgets/textfield.dart';

import '../consts/text_styles.dart';

class PromoBottomsheet extends StatefulWidget {
  const PromoBottomsheet({
    super.key,
  });

  @override
  State<PromoBottomsheet> createState() => _PromoBottomsheetState();
}

class _PromoBottomsheetState extends State<PromoBottomsheet> {
  final TextEditingController promoCodeController = TextEditingController();
  bool isPromoApplied = false;
  double discountAmount = 0.0;
  double totalAmount = 100.0; // Example total amount before discount

  void applyPromoCode() {
    setState(() {
      // Example logic to check the promo code and apply a discount
      if (promoCodeController.text == 'SAVE20') {
        discountAmount = 20.0; // Example discount value
        isPromoApplied = true;
      } else {
        isPromoApplied = false;
        discountAmount = 0.0;
      }
    });
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
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Enter Promo Code",
                style: jost500(19.sp, skyblue),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 29.h),
            CustomInputField(
              label: 'Promo Code',
              controller: promoCodeController,
            ),
            SizedBox(height: 33.h),
            CustomButton(
              width: 311.w,

              text: "Apply",
              fontSize: 16.sp,
              onPressed: () {
                applyPromoCode();
              },
            ),
            if (isPromoApplied) ...[
              SizedBox(height: 20.h),
              Text(
                "Discount Applied: \$${discountAmount.toStringAsFixed(2)}",
                style: jost500(16.sp, Colors.green),
              ),
              SizedBox(height: 10.h),
              Text(
                "Total Left to Pay: \$${(totalAmount - discountAmount).toStringAsFixed(2)}",
                style: jost500(16.sp, skyblue),
              ),
            ],
            SizedBox(height: 12.h),
            CustomButton(
              width: 311.w,
color: textfieldBorder,
              text: "Back",

              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: 29.h),
          ],
        ),
      ),
    );
  }
}
