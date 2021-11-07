import 'package:api_crud/app/modules/registration/providers/users_provider.dart';
import 'package:api_crud/app/modules/registration/users_model.dart';
import 'package:api_crud/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final TextEditingController userNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showText() {
    debugPrint(userNameTextEditingController.text);
    debugPrint(emailTextEditingController.text);
    debugPrint(passwordTextEditingController.text);
  }

  void registerUser() {
    Map<String, dynamic> user = Users(
            username: userNameTextEditingController.text,
            email: emailTextEditingController.text,
            password: passwordTextEditingController.text)
        .toJson();
    isLoading.value = true;
    UsersProvider().registration(user).then((value) {
      debugPrint("Got response : " + value.toString());
      // Get.back();
      isLoading.value = false;
      if (value != null) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar(
          "Failed",
          "Server is not responding\nPlease try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }, onError: (err) {
      Get.snackbar(
        "Failed",
        err.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      isLoading.value = false;
    });
  }
}
