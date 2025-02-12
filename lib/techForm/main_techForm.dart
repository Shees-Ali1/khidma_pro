import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/app_bar/CAppBar.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/techForm/personal.details.dart';
import 'package:khidma_pro/techForm/tech_controller.dart';
import 'package:khidma_pro/techForm/tech_services.dart';
import '../consts/text_styles.dart';
import 'document_screen.dart';



class MainTechForm extends StatefulWidget {
  const MainTechForm({super.key});

  @override
  State<MainTechForm> createState() => _TechSignupState();
}

class _TechSignupState extends State<MainTechForm> {
  final TechController techController = Get.put(TechController());
  List<String> index = [
    "0",
    "1",
    "2",
    "3",
  ];

  List<String> name = [
    "Personal",
    "Services",
    " Details ",
    "Documents",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus();
      },
      child: Scaffold(
        appBar: CAppBar(isMenu: false, isNotification: false, isTitle: true, isSecondIcon: false,title: 'Back',),
        backgroundColor: backgroundColor,

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.2.w),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: double.infinity,
                  height: 35.h,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: skyblue,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: index.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, val) {
                      return Obx(() {
                        return Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                techController.selectedIndex.value = index[val];
                              },
                              child: Container(
                                // width: 75.w,
                                padding: EdgeInsets.symmetric( horizontal: 15.w),
                                decoration: BoxDecoration(
                                  color: techController.selectedIndex.value ==
                                      index[val]
                                      ? whiteColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.58.r),
                                  border: Border.all(
                                    color: techController.selectedIndex.value ==
                                        index[val]
                                        ? whiteColor
                                        : skyblue,
                                    width: 0.41,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  name[val],
                                  style: jost700(
                                    10.sp,
                                    techController.selectedIndex.value ==
                                        index[val]
                                        ? skyblue
                                        : whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            // Add divider only if it's not the last item and not selected
                            if (val < index.length - 1 &&
                                techController.selectedIndex.value !=
                                    index[val] &&
                                techController.selectedIndex.value !=
                                    index[val + 1])
                              SizedBox(
                                width: 1,
                                height: 20.h,
                                child: Container(color: whiteColor),
                              ),
                          ],
                        );
                      });
                    },
                  )),
              SizedBox(height: 30.h),
              Expanded(
                child: Obx(() {
                  switch (techController.selectedIndex.value) {
                    case "0":
                      return PersonalDetailsForm();
                    case "1":

                      return ServicesScreen();
                    case "2":
                      return Text("");
                    case "3":

                      return DocumentsScreen();
                    default:
                      return Center(child: Text('Select an option.'));
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
