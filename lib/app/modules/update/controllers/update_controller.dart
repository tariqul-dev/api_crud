import 'package:api_crud/app/modules/home/providers/user_provider.dart';
import 'package:api_crud/app/modules/home/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  final count = 0.obs;
  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  User user = Get.arguments;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    nameTextEditingController.text = user.name!;
    firstNameTextEditingController.text = user.firstName!;
    lastNameTextEditingController.text = user.lastName!;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void updateUser() {
    isLoading(true);

    Map<String, dynamic> newUser = UpdateModel(
      name: nameTextEditingController.text,
      firstName: firstNameTextEditingController.text,
      lastName: lastNameTextEditingController.text,
    ).toJson();

    UserProvider().updateUser(newUser).then((value) {
      isLoading(false);
      if (value) {
        Get.back(result: value);
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
        "Server is not responding\nPlease try again",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }
}

class UpdateModel {
  final name;
  final firstName;
  final lastName;

  UpdateModel({this.name, this.firstName, this.lastName});

  Map<String, dynamic> toJson() => {
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
      };
}
