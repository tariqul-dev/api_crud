import 'package:api_crud/app/components/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          'Registration',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          labelText: "Username",
                          textEditingController:
                              controller.userNameTextEditingController,
                        ),
                        CustomTextField(
                          labelText: "Email",
                          textEditingController:
                              controller.emailTextEditingController,
                        ),
                        CustomTextField(
                          labelText: "Password",
                          textEditingController:
                              controller.passwordTextEditingController,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.registerUser();
                                },
                                child: Text("Registration"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
