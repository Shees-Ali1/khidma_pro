import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/text_styles.dart';

import '../controllers/Service-Provider-Controller/Ui-Controllers/AvailabilityController.dart';



class Availability extends StatelessWidget {
  const Availability({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the controller instance
    final AvailabilityController controller = Get.put(AvailabilityController());
    return Center(
      child: Container(
        width: 333.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: announcementMainContainer,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 2, color: announcementMainContainerBorder),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Availability",
                style: TextStyles.availability(),
              ),
              // Use Obx to listen for changes in the RxBool
              Obx(() => Switch(
                value: controller.isAvailable.value, // Reactive value
                onChanged: (value) {
                  controller.isAvailable.value = value; // Update the reactive value
                },
                activeColor: Colors.green, // Green color when the switch is on
                inactiveThumbColor: Colors.grey, // Color for the switch when off
                inactiveTrackColor: Colors.grey[300], // Background color when off
              )),
            ],
          ),
        ),
      ),
    );
  }
}
