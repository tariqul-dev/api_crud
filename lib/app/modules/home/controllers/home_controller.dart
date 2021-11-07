import 'package:api_crud/app/constants/names.dart';
import 'package:api_crud/app/modules/home/providers/user_provider.dart';
import 'package:api_crud/app/modules/home/user_model.dart';
import 'package:api_crud/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  var isLoading = false.obs;
  User? user;

  @override
  void onInit() {
    super.onInit();
    print("On init");
    fetchUser();
  }

  void fetchUser() {
    if (box.read(userToken) != null) {
      // var token = box.read(Names.userToken).toString();
      isLoading(true);
      UserProvider().getUserInfo().then(
        (value) {
          isLoading(false);
          if (value != null) {
            user = value;
            print("found: " + value.name.toString());
          } else {
            print("Value not found");
            user = User();

            Get.snackbar(
              "Error",
              "Server is not responding\nPlease try again",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        onError: (err) {
          Get.snackbar(
            "Error",
            "Server is not responding\nPlease try again",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          isLoading(false);
        },
      );
    } else {
      Get.snackbar(
        "Error",
        "Server is not responding\nPlease try again",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void updateUser() async {
    await Get.toNamed(Routes.UPDATE, arguments: user);
    Get.snackbar(
      "Success",
      "Profile updated",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    fetchUser();
  }

  void logout() {
    box.erase();
    Get.offAllNamed(AppPages.INITIAL);
  }
}
