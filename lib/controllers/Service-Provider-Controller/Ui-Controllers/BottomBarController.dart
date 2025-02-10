import 'package:get/get.dart';

class BottomBarController extends GetxController {
  // Reactive variable to hold the current index of the Bottom Navigation
  var currentIndex = 0.obs;

  // Method to update the current index
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}


class UserBottomBarController extends GetxController {
  // Reactive variable to hold the current index of the Bottom Navigation
  var currentIndex = 0.obs;

  // Method to update the current index
  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
