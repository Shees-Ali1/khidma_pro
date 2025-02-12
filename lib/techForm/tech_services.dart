import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';
import 'package:khidma_pro/techForm/tech_controller.dart';
import 'package:khidma_pro/widgets/buttons.dart';

import '../consts/text_styles.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  Set<String> selectedServices = {}; // Use a Set to track selected services
  final TechController techController = Get.find();

  // List of services to display
  final List<String> services = [
    'Moving',
    'Plumbing',
    'Deep Cleaning',
    'Move-In/Move-Out',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select Your Services.',
          style: jost600(15.17.sp, Color(0xff6B7280)),
        ),
        SizedBox(height: 30.h),
        Expanded(
          // Use Expanded to fill available space
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: services.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 91.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                      blurRadius: 12.0, // Softness of the shadow
                      offset: Offset(0, 4), // Horizontal and vertical offset of the shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(vertical: 8.h), // Add margin between items
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        deepClean,
                        height: 73.h,
                        width: 110.w,
                       // color: Colors.white,
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          services[index],
                          style: jost700(15.sp, skyblue),
                        ),
                      ),
                      Transform.scale(
                        scale: 1.5, // Adjust this value to increase or decrease the size
                        child: Radio<String>(
                          value: services[index],
                          groupValue: selectedServices.contains(services[index]) ? services[index] : null,
                          onChanged: (String? value) {
                            setState(() {
                              if (selectedServices.contains(value)) {
                                selectedServices.remove(value); // Deselect if already selected
                              } else {
                                selectedServices.add(value!); // Select if not already selected
                              }
                            });
                          },
                          activeColor:greyColor,
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return skyblue;
                              }
                              return greyColor;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        CustomButton(
          width: 311.w,
          text: 'Next',
          onPressed: () {
            // Save selected services to the controller
            techController.updateSelectedServices(selectedServices);

            // Navigate by updating selectedIndex
            techController.selectedIndex.value = "2";
          },
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
