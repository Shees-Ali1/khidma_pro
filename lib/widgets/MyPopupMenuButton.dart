import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/text_styles.dart';
import 'package:khidma_pro/widgets/Availability.dart';

import '../consts/colors.dart';
import '../controllers/Service-Provider-Controller/Ui-Controllers/AvailabilityController.dart';
class DropdownWidget extends StatefulWidget {
  final bool isEnabled; // Required boolean parameter to control behavior

  // Constructor with the required boolean parameter
  const DropdownWidget({Key? key, required this.isEnabled}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  // Global key to open/close the dropdown menu programmatically
  final GlobalKey _dropdownKey = GlobalKey();
  final AvailabilityController controller = Get.put(AvailabilityController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: widget.isEnabled ? () {
          // Show the dropdown menu when the container is tapped, only if enabled
        } : null, // Disable tap action if isEnabled is false
        child: Container(
          height: 26.h,
          width: widget.isEnabled ? 87:125.w,
          decoration: BoxDecoration(
            color: skyblue , // Change color based on isEnabled
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                key: _dropdownKey, // Set key to control the dropdown
                value:  widget.isEnabled ? controller.selectedOption.value :controller.selectedOptionType.value,
                underline: SizedBox(), // Removes the underline
                iconSize: 0, // Hides the default icon
                onChanged: widget.isEnabled ? (newValue) {
                  if (newValue != null) {
                    controller.selectOption(newValue); // Update selected option
                  }
                } : (newValue) {
                  if (newValue != null) {
                    controller.selectOptionType(newValue); // Update selected option
                  }
                } , // Disable the dropdown menu if isEnabled is false
                dropdownColor: Colors.blue, // Set the background color of the dropdown menu
                items:
                widget.isEnabled ?

                controller.options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyles.dropDownText().copyWith(color: Colors.white), // Text color inside the dropdown
                    ),
                  );
                }).toList():controller.optionsType.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyles.dropDownText().copyWith(color: Colors.white), // Text color inside the dropdown
                    ),
                  );
                }).toList()
              ),
              SizedBox(width: 10.w),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      );
    });
  }
}

