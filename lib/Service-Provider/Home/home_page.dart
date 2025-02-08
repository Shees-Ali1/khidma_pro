import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';

import '../../app_bar/CustomAppBar.dart';
import '../../consts/text_styles.dart';
import '../../controllers/Service-Provider-Controller/Ui-Controllers/AvailabilityController.dart';
import '../../drawer/CustomDrawer.dart';
import '../../widgets/Availability.dart';
import '../../widgets/MyPopupMenuButton.dart';
import '../../widgets/ScrollableAnnouncementWidget.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final AvailabilityController controller = Get.put(AvailabilityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Home', // Title of the app
        showDrawer: true, // Show drawer icon (true/false)
        showBackArrow: false, // Show back arrow if needed (true/false)
        showNotificationsIcon: true, // Show notifications icon (true/false)
        showSettingsIcon: true, // Show settings icon (true/false)
      ),
      drawer: const CustomDrawer(), // Use the custom drawer here
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// & TITLE
              Padding(
                padding:  EdgeInsets.only(top: 17.0.h,bottom: 17.0.h),
                child: Text(
                  "Hi Hugh Quinn",
                  style: TextStyles.titleText(),
                ),
              ),
              /// & Announcement
              const ScrollableAnnouncementWidget(),
              SizedBox(height: 7,),
              /// & Availability
              const Availability(),
              SizedBox(height: 7,),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownWidget(isEnabled: false,),
                  DropdownWidget(isEnabled: true,),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
