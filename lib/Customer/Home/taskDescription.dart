import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khidma_pro/app_bar/CustomAppBar.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/widgets/buttons.dart';
import 'package:khidma_pro/consts/images.dart';
import 'package:khidma_pro/consts/text_styles.dart';
import 'package:khidma_pro/widgets/smallContainers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class TaskDescription extends StatelessWidget {
  final SelectionController controller = Get.put(SelectionController());
  final ImagePicker _picker = ImagePicker();


  Future<void> _uploadImageOrVideo() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      // Handle the file upload
      print('File path: ${file.path}');
    }
  }

  Future<void> _selectLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    LatLng selectedLocation = LatLng(position.latitude, position.longitude);
    // Handle the selected location
    print('Selected location: $selectedLocation');
  }


  Future<void> _showDateTimePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      TimeOfDay? selectedTime = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.now(),
      );
      if (selectedTime != null) {
        // Handle the selected date and time
        print('Selected date and time: $selectedDate $selectedTime');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Task Description',
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 27.h),
              Text(
                'House Cleaning',
                style: TextStyles.titleTextBig(),
              ),
              SizedBox(height: 13.h),
              GestureDetector(
                onTap: _uploadImageOrVideo,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                  height: 55.h,
                  width: 333.w,
                  decoration: BoxDecoration(
                    color: textfieldColor,
                    border: Border.all(color: textfieldBorder, width: 1.w),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Upload Picture/Video',
                        style: TextStyles.smallTextBlack(),
                      ),
                      CustomSmallContainers(
                        text: 'Upload',
                        iconAsset: upload,
                        width: 85.w,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              GestureDetector(
                onTap: _selectLocation,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                  height: 55.h,
                  width: 333.w,
                  decoration: BoxDecoration(
                    color: textfieldColor,
                    border: Border.all(color: textfieldBorder, width: 1.w),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Select Location',
                        style: TextStyles.smallTextBlack(),
                      ),
                      CustomSmallContainers(
                        text: 'Select on Maps',
                        iconAsset: location,
                        width: 121.w,
                        iconPadding: EdgeInsets.all(2),
                        spacing: 5,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                height: 55.h,
                width: 333.w,
                decoration: BoxDecoration(
                  color: textfieldColor,
                  border: Border.all(color: textfieldBorder, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Time',
                      style: TextStyles.smallTextBlack(),
                    ),
                    Row(
                      children: [
                        Obx(() => CustomSmallContainers(
                          text: 'Now',
                          width: 73.w,
                          isSelected: controller.selectedOption.value == 'Now',
                          selectedColor: skyblue,
                          unselectedColor: Colors.grey,
                          onTap: () => controller.selectOption('Now'),
                        )),
                        SizedBox(width: 8.w),
                        Obx(() => CustomSmallContainers(
                          text: 'Later',
                          width: 73.w,
                          isSelected: controller.selectedOption.value == 'Later',
                          selectedColor: skyblue,
                          unselectedColor: Colors.grey,
                          onTap: () {
                            controller.selectOption('Later');
                            _showDateTimePicker();
                          },
                        )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 6.h),
              GestureDetector(
               // onTap: _recordVoiceNote,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
                  height: 55.h,
                  width: 333.w,
                  decoration: BoxDecoration(
                    color: textfieldColor,
                    border: Border.all(color: textfieldBorder, width: 1.w),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Record Voice Notes',
                        style: TextStyles.smallTextBlack(),
                      ),
                      Image.asset(Record, color: skyblue, height: 49.h, width: 49.w)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),

                width: 333.w,
                decoration: BoxDecoration(
                  color: textfieldColor,
                  border: Border.all(color: textfieldBorder, width: 1.w),
                  borderRadius: BorderRadius.circular(8.r),
                ),

                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Describe your task',
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                  style: TextStyles.smallTextBlack(),
                ),
              ),
              SizedBox(height: 50.h),
              Center(
                child: CustomButton(
                  text: 'Next',
                  onPressed: () {},
                  width: 311.w,
                ),
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionController extends GetxController {
  var selectedOption = 'Now'.obs;

  void selectOption(String option) {
    selectedOption.value = option;
  }
}