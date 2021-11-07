import 'package:api_crud/app/constants/names.dart';
import 'package:api_crud/app/modules/login/providers/login_info_provider.dart';
import 'package:api_crud/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {

  final TextEditingController userNameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  var isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}

  loginUser() {
    isLoading(true);
    LoginInfoProvider()
        .loginUser(
      userNameTextEditingController.text,
      passwordTextEditingController.text,
    )
        .then((value) {
      debugPrint("controller value: $value");
      isLoading(false);
      if (value != null) {
        box.write(userToken, value.token);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(
          "Error",
          "Server is not responding\nPlease try again",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }, onError: (err) {
      isLoading(false);
      Get.snackbar(
        "Error",
        err.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }
}
