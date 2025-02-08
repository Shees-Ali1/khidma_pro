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
}
