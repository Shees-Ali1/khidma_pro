import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/role_screen.dart';

class TechController extends GetxController {

  final SignupController signupController = Get.put(SignupController());

  RxString selectedIndex = "0".obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString bio = ''.obs;
  RxSet<String> selectedServices = <String>{}.obs;
  RxList<String?> documentPaths = <String?>[].obs;

  void updateUserDetails({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String phoneNumber,
    required String? gender,
  }) {}

  void updateBio(String bioDescription) {}

  void updateGender(String? gender) {}

  void updateSelectedServices(Set<String> services) {}

  void updateDocuments(List<String?> documents) {}

  Future<void> saveTechUser() async {}
}
