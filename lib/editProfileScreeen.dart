import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khidma_pro/app_bar/CAppBar.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/widgets/Custom_dropdown.dart';
import 'package:khidma_pro/widgets/buttons.dart';
import 'package:khidma_pro/widgets/textfield.dart';
import 'consts/images.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CAppBar(
        isMenu: false,
        isNotification: false,
        isTitle: true,
        isSecondIcon: false,
        title: 'Profile',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 44.h),

            /// Profile Image with Image Picker
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 138.w,
                    child: SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: CircleAvatar(
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!) as ImageProvider
                            : AssetImage(profile_image),
                        radius: 60,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 80,
                  child: GestureDetector(
                    onTap: pickImage, // Open image picker when tapped
                    child: Container(
                      height: 46.h,
                      width: 46.w,
                      decoration: BoxDecoration(
                        color: skyblue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        FontAwesomeIcons.camera,
                        color: whiteColor,
                        size: 23.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),

            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    label: 'First Name',
                    labelTextSize: 13.sp,
                    prefixIcon: Icon(
                      Icons.person,
                      color: skyblue,
                      size: 18.sp,
                    ),
                  ),
                ),
                SizedBox(width: 19.w),
                Expanded(
                  child: CustomInputField(
                    contentPadding: EdgeInsets.symmetric(vertical: 1),
                    label: 'Last Name',
                    labelTextSize: 13.sp,
                    prefixIcon: Icon(
                      Icons.person,
                      color: skyblue,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            CustomInputField(
              label: 'Your Email',
              prefixIcon: Icon(
                Icons.email_rounded,
                color: skyblue,
                size: 18.sp,
              ),
            ),
            SizedBox(height: 25.h),
            CustomDropdownField(
              label: 'Select Gender',
              items: const ['Male', 'Female'],
              dropdownIconImage: arrow_down,
              onChanged: (value) {},
            ),
            SizedBox(height: 25.h),

            CustomButton(text: 'Save Changes', onPressed: (){},width: 311.w,fontSize: 19.sp,)
          ],
        ),
      ),
    );
  }
}
