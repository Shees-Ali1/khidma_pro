import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/text_styles.dart';
import 'package:khidma_pro/widgets/Availability.dart';

import '../consts/colors.dart';
import '../controllers/Service-Provider-Controller/Ui-Controllers/AvailabilityController.dart';
class DropdownWidget extends StatefulWidget {
  final bool isEnabled; // Required boolean parameter to control behavior

  const DropdownWidget({Key? key, required this.isEnabled}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  final AvailabilityController controller = Get.put(AvailabilityController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 26.h,
        width: widget.isEnabled ? 87.w : 125.w,
        decoration: BoxDecoration(
          color: skyblue, // Change color based on isEnabled
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: widget.isEnabled
                ? controller.selectedOption.value
                : controller.selectedOptionType.value,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
              size: 20,
            ),
            iconSize: 20,
            dropdownColor: Colors.blue, // Background color of the dropdown menu
            style: TextStyles.dropDownText().copyWith(color: Colors.white),
            onChanged: widget.isEnabled
                ? (newValue) {
              if (newValue != null) {
                controller.selectOption(newValue); // Update selected option
              }
            }
                : (newValue) {
              if (newValue != null) {
                controller.selectOptionType(newValue); // Update selected option
              }
            },
            items: widget.isEnabled
                ? controller.options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Center(
                  child: Text(
                    option,
                    style: TextStyles.dropDownText()
                        .copyWith(color: Colors.white),
                  ),
                ),
              );
            }).toList()
                : controller.optionsType.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Center(
                  child: Text(
                    option,
                    style: TextStyles.dropDownText()
                        .copyWith(color: Colors.white),
                  ),
                ),
              );
            }).toList(),
            isExpanded: true, //
          ),
        ),
      );
    });
  }
}

