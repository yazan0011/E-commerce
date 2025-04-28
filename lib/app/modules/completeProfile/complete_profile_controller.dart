import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  var countryCode = "+1".obs;
  var gender = "".obs;

  void completeProfile() {
    // You can handle form validation and submission here
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        gender.value.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
    } else {
      // Process the data
      Get.snackbar("Success", "Profile Completed Successfully");
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
