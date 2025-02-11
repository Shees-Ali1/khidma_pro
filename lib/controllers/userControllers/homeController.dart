import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';

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