import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/userControllers/topServiceController.dart';

class SlidingMenu extends StatefulWidget {
  @override
  _SlidingMenuState createState() => _SlidingMenuState();
}

class _SlidingMenuState extends State<SlidingMenu> {
  final TopServiceController topServiceController = Get.find<TopServiceController>();
  late PageController _pageController;
  final ValueNotifier<int> _currentPage = ValueNotifier(0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.95);

    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_currentPage.value < topServiceController.imageUrls.length - 1) {
        _currentPage.value++;
      } else {
        _currentPage.value = 0;
      }
      _pageController.animateToPage(
        _currentPage.value,
        duration: Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (topServiceController.imageUrls.isEmpty) {
        return Center(
          child: Text('No Ads', style: TextStyle(fontSize: 16.sp, color: Colors.red)), // Replace with your style
        );
      }

      return Column(
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => _currentPage.value = index,
              itemCount: topServiceController.imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w), // Add horizontal spacing
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.w),
                    child: Image.asset(
                      topServiceController.imageUrls[index], // Use Image.asset for static assets
                      fit: BoxFit.fill,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
          ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (context, value, child) {
              return SmoothPageIndicator(
                controller: _pageController,
                count: topServiceController.imageUrls.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 8.w,
                  dotWidth: 8.w,
                  activeDotColor:skyblue,
                  dotColor: Colors.grey,
                ),
              );
            },
          ),
        ],
      );
    });
  }
}

