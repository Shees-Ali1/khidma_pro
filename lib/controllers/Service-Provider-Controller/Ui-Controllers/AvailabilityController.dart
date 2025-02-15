import 'package:get/get.dart';

class AvailabilityController extends GetxController {
  var isAvailable = true.obs; // Default value is true
  var isActive = true.obs; // Observable variable for state toggling
  var selectedOption = "Coming up".obs; // Observable for selected option

  // List of options
  var options = ["All", "Coming up", "Progress"].obs;

  // Method to change the selected option
  void selectOption(String option) {
    selectedOption.value = option;
  }





  var selectedOptionType=  "Office Cleaning".obs; // Observable for selected option

  // List of options
  var optionsType = ["Office Cleaning", "Home Cleaning", "Carpet Cleaning"].obs;

  // Method to change the selected option
  void selectOptionType(String option) {
    selectedOptionType.value = option;
  }





  var reviews=  "5 stars".obs; // Observable for selected option

  // List of options
  var review = ["5 stars", "4 stars", "3 stars","4 stars","5 star"].obs;

  // Method to change the selected option
  void selectReviews(String option) {
    reviews.value = option;
  }


  // var review = "5 stars".obs ;
  // var reviews = ["5 stars", "4 stars", "3 stars","2 stars","1 star"].obs;
  //
  // // Method to change the selected option
  // void SelectReviews(String option) {
  //   reviews.value = option;
  // }

}
