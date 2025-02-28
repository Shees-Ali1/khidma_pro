import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/Customer/Home/OfferScreens/BidBootomSheet.dart';
import 'package:khidma_pro/consts/colors.dart'; // Your provided colors


import '../../../Service-Provider/tech_reviews.dart';
import '../../../app_bar/CustomAppBar.dart';
import '../../../consts/images.dart';
import '../../../consts/text_styles.dart';
import '../../../navbar_screens/navbar.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/serviceAccepted.dart';
import '../../../widgets/smallContainers.dart';
import 'OfferContainer.dart';

class SearchOfferScreen extends StatelessWidget {

  const SearchOfferScreen({super.key,});

  // Dummy data for offers
  static List<Map<String, dynamic>> dummyOffers = [
     {
      'image': tech_2,
      'nationality': 'USA',
      'name': 'John Doe',
      'experience': '5 years of experience',
      'price': '50',
      'rating': '4.5',
      'reviews': ['Great service!', 'Very professional'],
      'bidderId': 'bidder1',
      'skills': ['Plumbing', 'Electrical'],
      'bio': 'Experienced technician with a focus on quality.',
      'customerId': 'customer1',
      'taskId': 'task1',
      'title': 'Plumbing',
      'formattedDate': '2025-03-01',
      'formattedTime': '10:30 AM',
    },
    {
      'image': tech_2,
      'nationality': 'Canada',
      'name': 'Jane Smith',
      'experience': '3 years of experience',
      'price': '45',
      'rating': '4.8',
      'reviews': ['Quick and reliable', 'Highly recommended'],
      'bidderId': 'bidder2',
      'skills': ['Carpentry', 'Painting'],
      'bio': 'Skilled in multiple trades.',
      'customerId': 'customer1',
      'taskId': 'task2',
      'title': 'Carpentry',
      'formattedDate': '2025-03-02',
      'formattedTime': '02:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor, // Using your backgroundColor
      appBar: CustomAppBar(
        title: 'Offers', // Title of the app
        showDrawer: false, // Show drawer icon (true/false)
        showBackArrow: true, // Show back arrow if needed (true/false)
        showNotificationsIcon: false, // Show notifications icon (true/false)
        showSettingsIcon: false, // Show settings icon (true/false)
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              _buildHeader(),
              SizedBox(height: 20.h),
              Expanded(
                child: dummyOffers.isEmpty
                    ? _buildEmptyState(context)
                    : _buildOfferList(context),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(Icons.search, color: blackColor, size: 18.sp), // Using skyblue
            SizedBox(width: 2.w),
            Text(
              "Searching Best Offers",
              style: jost700(16.sp, blackColor), // Using skyblue
            ),
          ],
        ),
        _buildSortDropdown(),
      ],
    );
  }

  Widget _buildSortDropdown() {
    const List<String> sortOptions = ['Newest', 'Lowest Price', 'Rating'];
    String selectedFilter = 'Newest'; // Static state for simplicity

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.h),
      decoration: BoxDecoration(
        color: skyblue, // Using skyblue
        borderRadius: BorderRadius.circular(9.w),
        border: Border.all(color: whiteColor, width: 1.0), // Using whiteColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            " Sort by ",
            style: jost400(10.sp, whiteColor), // Using whiteColor
          ),
          SizedBox(width: 1.w),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedFilter,
              dropdownColor: skyblue, // Using black
              onChanged: (String? newValue) {
                // No state update needed for static UI
              },
              items: sortOptions.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: jost400(10.sp, whiteColor), // Using whiteColor
                  ),
                );
              }).toList(),
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 12.w,
                color: whiteColor, // Using whiteColor
              ),
              style: jost400(10.sp, whiteColor), // Using whiteColor
              menuMaxHeight: 200,
              alignment: Alignment.bottomCenter,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitCircle(
          color: skyblue, // Using skyblue
          size: 100.0,
        ),
        SizedBox(height: 20.h),
        Text(
          "Waiting for Offers",
          style: jost600(18.sp, skyblue), // Using skyblue
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.h),
        Text(
          "We're working on your request and connecting you with the best technicians. Please hold.",
          style: jost400(16.sp, blackColor), // Using blackColor
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.h),
        _buildCancelButton(context),
      ],
    );
  }

  Widget _buildOfferList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 70.h,
            child: SpinKitCircle(
              color: skyblue, // Using skyblue as you specified
              size: 70.0,
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyOffers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: index != 0 ? 10.h : 0),
                child: OfferContainer(
                ),
              );
            },
          ),
          SizedBox(height: 50.h),
          _buildCancelButton(context),
        ],
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return CustomButton(

      width: double.infinity,
      height: 45.h,
      color: skyblue, // Using black
      text: "Cancel",
        textColor: Colors.white,
        fontSize: 16.sp,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _CancelDialog(onConfirm: () { Get.back(); },

            );
          },
        );
      },
    );
  }
}

// Separate widget for the cancel dialog
class _CancelDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const _CancelDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      backgroundColor: whiteColor, // Using whiteColor
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Are you sure?",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: black, // Using black
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Do you really want to cancel?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: greyColor, // Using greyColor
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: skyblue, // Using black
                    foregroundColor: whiteColor, // Using whiteColor
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  ),
                  child: Text(
                    "Yes",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greyColor, // Using greyColor
                    foregroundColor: black, // Using black
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  ),
                  child: Text(
                    "No",
                    style: TextStyle(fontSize: 14.sp,color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




