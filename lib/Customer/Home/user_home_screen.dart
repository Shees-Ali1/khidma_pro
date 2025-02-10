import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/Customer/Home/services_container.dart';
import 'package:khidma_pro/Customer/Home/sliding_menu.dart';
import 'package:khidma_pro/Customer/Home/taskDescription.dart';
import 'package:khidma_pro/Customer/Home/task_description_video.dart';
import 'package:khidma_pro/app_bar/CustomAppBar.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/controllers/Service-Provider-Controller/Ui-Controllers/BottomBarController.dart';

import '../../authentication/role_screen.dart';
import '../../widgets/ScrollableAnnouncementWidget.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final HomeController homeController = Get.put(HomeController());//initialize HomeController
  final UserBottomBarController navBarController = Get.find<UserBottomBarController>();
  final TopServiceController topServiceController = Get.put(TopServiceController());

  @override
  void initState() {
    super.initState();
    topServiceController.resetFilters();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(
          title: 'Home', // Title of the app
          showDrawer: true, // Show drawer icon (true/false)
          showBackArrow: false, // Show back arrow if needed (true/false)
          showNotificationsIcon: true, // Show notifications icon (true/false)
          showSettingsIcon: true,
          // Show settings icon (true/false)
        ),        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.5.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  SlidingMenu(),
                  SizedBox(height: 8.h),
                  const ScrollableAnnouncementWidget(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Top Services", style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Jost',
                        color: black,
                      )),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Column(
                    children: [
                      MasonryGridView.count(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.w,
                        crossAxisSpacing: 20.w,
                        itemCount: 4, // Static services
                        itemBuilder: (context, index) {
                          final services = [
                            {"title": "Cleaning", "image": "assets/images/house_cleaning.png"},
                            {"title": "Plumbing", "image": "assets/images/plumbing.png"},
                            {"title": "Electrician", "image": "assets/images/gardening.png"},
                            {"title": "Carpentry", "image": "assets/images/tv_mounting.png"},
                          ];
                          final service = services[index];
                          return GestureDetector(
                            onTap: (){
                              Get.to(TaskDescription());
                            },
                            child: ServicesContainer(
                              image: service["image"]!, // Use the null assertion operator (!)
                              title: service["title"]!, // Use the null assertion operator (!)
                            ),
                          );
                        },
                      ),        ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserNameWidget extends StatelessWidget {
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Hello, ${homeController.userName.value}',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Jost',
            color: skyblue,
          ),
        ),
      ],
    ));
  }
}

TextStyle jost700(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Jost',
    color: color,
  );
}


class HomeController extends GetxController {
  RxString isHome = "customer main".obs;
  var userName = 'Loading...'.obs;
  RxBool isMenu = true.obs;
  RxBool isTitle = false.obs;
  RxBool isNotification = true.obs;
  RxBool isSecondIcon = false.obs;
  RxString title = "".obs;
  RxString service = "".obs;
  RxBool uploadSpareParts = false.obs;
  var showAllServices = false.obs;
  final ScrollController scrollController = ScrollController();

  void toggleServices() {
    showAllServices.value = !showAllServices.value;

    // Delay scrolling to avoid stutter
    Future.delayed(Duration(milliseconds: 100), () {
      if (showAllServices.value) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void updateAppBar (bool menu,bool titleBool, bool notification, bool secondIcon, String titleString){
    isMenu.value = menu;
    isNotification.value = notification;
    isTitle.value = titleBool;
    isSecondIcon.value = secondIcon;
    title.value = titleString;
  }

}