import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../consts/colors.dart';

class TopServiceController extends GetxController {
  // Reactive list for static services
  var topServices = <Map<String, dynamic>>[
    {"image": "assets/images/onboard1.png", "title": "Cleaning"},
    {"image": "assets/images/onboard1.png", "title": "Plumbing"},
    {"image": "assets/images/onboard1.png", "title": "Electrician"},
    {"image": "assets/images/onboard1.png", "title": "Carpentry"},
  ].obs;

  var searchTerm = ''.obs; // Reactive search term
  var showAllServices = true.obs; // Track the state of "View all"

  // Reactive list for image URLs
  var imageUrls = <String>[
    "assets/images/Ads.png",
    "assets/images/Ads.png",
    "assets/images/Ads.png",
  ].obs;

  // Getter for filtered services
  List<Map<String, dynamic>> get filteredServices {
    if (searchTerm.value.isEmpty) {
      return topServices;
    } else {
      return topServices.where((service) {
        return service['title']
            .toLowerCase()
            .contains(searchTerm.value.toLowerCase());
      }).toList();
    }
  }

}