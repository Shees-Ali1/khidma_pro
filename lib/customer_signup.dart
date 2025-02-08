//
//
// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:repairoo/controllers/signup_controller.dart';
// import 'package:repairoo/views/bottom_nav/bottom_nav.dart';
// import '../../../const/color.dart';
// import '../../../const/images.dart';
// import '../../../const/text_styles.dart';
// import '../../../controllers/user_controller.dart';
// import '../../../widgets/custom_button.dart';
// import '../../../widgets/custom_input_fields.dart';
// import '../../../widgets/drop_down_widget.dart';
// import '../otp_verification/otp_verification.dart';
//
// class CustomerSignup extends StatefulWidget {
//   const CustomerSignup({super.key});
//
//   @override
//   State<CustomerSignup> createState() => _CustomerSignupState();
// }
//
// class _CustomerSignupState extends State<CustomerSignup> {
//
//
//
//
//
//   Future<void> saveUserData(String uid, String phoneNumber) async {
//     storage.setItem('phoneNumber', phoneNumber);
//     storage.setItem('uid', uid);
//   }
//
//   Future<void> signup(String phoneNumber) async {
//     try {
//
//       setState(() {
//         isLoading = true;
//       });
//       print(' signupController.email.text ${ signupController.email.text}');
// // Check if the email exists in either userDetails or tech_users collections
//       final userDetailsQuery = await FirebaseFirestore.instance
//           .collection('userDetails')
//           .where('userEmail', isEqualTo: signupController.email.text)
//           .get();
//
//       final techUsersQuery = await FirebaseFirestore.instance
//           .collection('tech_users')
//           .where('email', isEqualTo:  signupController.email.text)
//           .get();
//
//       if (userDetailsQuery.docs.isNotEmpty || techUsersQuery.docs.isNotEmpty) {
//         // Email already exists in one of the collections
//         Get.snackbar(
//           "Error",
//           "Email already registered!",
//           backgroundColor: Colors.white,
//           colorText: Colors.black,
//         );
//         return;
//       }
//
//           final userId = FirebaseAuth.instance.currentUser?.uid;
//           final timestamp = FieldValue.serverTimestamp();
//
//
//           // Create a dynamic wallet document for the user
//           if (userId != null) {
//             await signupController.saveUserData(FirebaseAuth.instance.currentUser!.uid, phoneNumber);
//
//             await FirebaseFirestore.instance
//                 .collection('CustomerWallets')
//                 .doc(userId)
//                 .set({
//               'walletDetails': {
//                 'AvailableBalance': 0.0,
//                 'createdAt': timestamp,
//               },
//               'transactions': [], // Dynamic transactions array for this user
//               'uid': userId, // Store the user ID
//             });
//             saveUserData(FirebaseAuth.instance.currentUser!.uid, phoneNumber);
//             Get.offAll(AppNavBar());
//           } else {
//             Get.snackbar(
//               "Error",
//               "Some error occurred!",
//               backgroundColor: Colors.white,
//               colorText: Colors.black,
//             );
//           }
//
//
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       Get.snackbar(
//         "Error",
//         e.toString(),
//         backgroundColor: Colors.white,
//         colorText: Colors.black,
//       );
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     print(signupController.userRole);
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context)
//             .unfocus(); // Close the keyboard when tapping outside
//       },
//       child: Scaffold(
//         backgroundColor: AppColors.secondary,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage(AppImages.onboardingelipse2),
//                         fit: BoxFit.fill)),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 50.h,
//                     ),
//                     GestureDetector(
//                       onTap: (){
//                         Get.back();
//                       },
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 10.w),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               color: Colors.white,
//                               AppImages.bigArrow,
//                               scale: 3,
//                             ),
//                             Image.asset(
//                               color: Colors.white,
//                               AppImages.bigArrow,
//                               scale: 4.5,
//                             ),
//                             SizedBox(width: 9.w),
//                             Text(
//                               'Back Home',
//                               style: jost600(20.sp, Colors.white),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 30.h),
//                     SizedBox(
//                       height: 85.h,
//                       width: 267.w,
//                       child: Image.asset(
//                         color: Colors.white,
//                         AppImages.logo,
//                       ),
//                     ),
//                     SizedBox(height: 40.h),
//                     Text(
//                       'Sign up',
//                       style: jost700(35.sp, AppColors.secondary),
//                     ),
//                     SizedBox(height: 30.h),
//                     GestureDetector(
//                       onTap: () async {
//                         try {
//                           // Generate a temporary unique ID for signup (e.g., UUID or timestamp)
//                           final String tempUserId = DateTime.now().millisecondsSinceEpoch.toString();
//                           print('Temporary User ID for signup: $tempUserId');
//
//                           // Call the image picker and upload function with the temporary ID
//                           await signupController.pickImageAndUpload(tempUserId);
//                         } catch (e) {
//                           print('Error occurred in onTap: $e');
//                         }
//                       },
//                       child: Obx(
//                             () {
//                           // Check if the image file is null
//                           return Container(
//                             width: 106.w,
//                             height: 106.h,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                               image: signupController.imageFile.value != null
//                                   ? DecorationImage(
//                                 image: FileImage(signupController.imageFile.value!),
//                                 fit: BoxFit.cover,
//                               )
//                                   : null, // When no image is selected, we don't set an image in the decoration
//                             ),
//                             child: signupController.imageFile.value == null
//                                 ? (signupController.selectedGender.value.isEmpty
//                                 ? Container() // Show an empty container if no gender is selected
//                                 : Center(
//                               child: SizedBox(
//                                 height: 50.h,
//                                 width: 50.w,
//                                 child: Image.asset(
//                                   signupController.selectedGender.value == 'Male'
//                                       ? AppImages.gender_default // Default male profile image
//                                       : AppImages.derfault_female, // Default female profile image
//
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ))
//                                 : null, // Only show the default image when no profile image is selected
//                           );
//                         },
//                       ),
//                     ),
//
//
//
//
//                     SizedBox(height: 30.h),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 48.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: CustomInputField(
//                   label: 'First and Last Name',
//                   controller: signupController.name,
//                   prefixIcon: Icon(
//                     Icons.person,
//                     color: AppColors.primary,
//                     size: 18.sp,
//                   ), // Add prefix icon here
//                 ),
//               ),
//               SizedBox(height: 16.h),
//
//               // Padding(
//               //   padding: EdgeInsets.symmetric(horizontal: 24.w),
//               //   child: CustomInputField(
//               //     label: 'last name',
//               //     controller: signupController.lastname,
//               //     prefixIcon: Icon(
//               //       Icons.person,
//               //       color: AppColors.primary,
//               //       size: 18.sp,
//               //     ), // Add prefix icon here
//               //   ),
//               // ),
//               // SizedBox(height: 16.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: CustomInputField(
//                   label: 'Your Email',
//                   controller: signupController.email,
//                   prefixIcon: Icon(
//                     Icons.email_rounded,
//                     color: AppColors.primary,
//                     size: 18.sp,
//                   ), // Add prefix icon here
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               Obx(
//                     () => GestureDetector(
//                   onTap: () {
//                     userController.openCityDropDown.value = !userController.openCityDropDown.value;
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 28),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
//                       decoration: BoxDecoration(
//                         color: AppColors.fill,
//                         borderRadius: BorderRadius.circular(13.31.r),
//                         border: Border.all(
//                           color: AppColors.textFieldGrey,
//                           width: 0.95.w,
//                         ),
//                       ),
//                       alignment: Alignment.center,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Icon(
//                                 Icons.location_on_outlined,
//                                 size: 20.w,
//                                 color: AppColors.primary,
//                               ),
//                               SizedBox(width: 12.w),
//                               Text(
//                                 userController.cities.contains(userController.cityName.value)
//                                     ? userController.cityName.value
//                                     : "Select City",
//                                 style: jost500(14.65.sp, AppColors.primary),
//                               ),
//                               Spacer(),
//                               Icon(Icons.keyboard_arrow_down_outlined),
//                             ],
//                           ),
//                           if (userController.openCityDropDown.value) SizedBox(height: 10.h),
//                           if (userController.openCityDropDown.value)
//                             ListView.builder(
//                               itemCount: userController.cities.length,
//                               shrinkWrap: true,
//                               padding: EdgeInsets.zero,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     userController.cityName.value = userController.cities[index];
//                                     userController.openCityDropDown.value = false;
//                                   },
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(vertical: 4.h),
//                                     child: Text(
//                                       userController.cities[index],
//                                       style: jost400(14.sp, AppColors.primary),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               SizedBox(height: 16.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: GenderDropdownField(
//                   label: 'Gender',
//                   iconPath:
//                   'assets/images/gender_icon.png', // Specify the image asset path
//                   iconHeight: 18.h, // Set your desired height
//                   iconWidth: 18.w, // Set your desired width
//                 ),
//               ),
//               SizedBox(
//                 height: 33.h,
//               ),
//               isLoading
//                   ? const CircularProgressIndicator(color: Colors.white)
//               :Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: CustomElevatedButton(
//                   text: 'Continue',
//                   textColor: AppColors.secondary,
//                   onPressed: () {
//                     // Perform validation
//                     if (signupController.name.text.isEmpty ||
//                         signupController.email.text.isEmpty) {
//                       Get.snackbar(
//                         'Error',
//                         'Please fill all the above fields',
//                         snackPosition: SnackPosition.TOP,
//                         backgroundColor: Colors.red,
//                         colorText: Colors.white,
//                       );
//                     } else {
//                       // Call the signup function if all fields are filled
//                       signup(signupController.phonenumber.text);
//                     }
//                   },
//                   backgroundColor: AppColors.primary, // Custom background color
//                 ),
//               ),
//               SizedBox(
//                 height: 14.h,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 18.w),
//                 child: RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'By signing up you agree to our ',
//                         style: jost400(14.sp, AppColors.primary),
//                       ),
//                       TextSpan(
//                         text: 'Terms of Services',
//                         style: jost500(14.sp, AppColors.primary),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             // Navigate to Terms of Services
//                             // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => TermsPage()));
//                           },
//                       ),
//                       TextSpan(
//                         text: ' and ',
//                         style: jost400(14.sp, AppColors.primary),
//                       ),
//                       TextSpan(
//                         text: 'Privacy Policy',
//                         style: jost500(14.sp, AppColors.primary),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             // Navigate to Privacy Policy
//                             // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
//                           },
//                       ),
//                       TextSpan(
//                         text: '.',
//                         style: jost400(14.sp, AppColors.primary),
//                       ),
//                     ],
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }