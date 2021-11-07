import 'package:api_crud/app/modules/home/components/details_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              // print("logout calling");
              controller.logout();
            },
            icon: Icon(Icons.logout),
            tooltip: "Logout",
          ),
          IconButton(
            onPressed: () {
              // print("logout calling");
              controller.fetchUser();
            },
            icon: Icon(Icons.refresh),
            tooltip: "Refresh",
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          print("Refreshed");
        },
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.user!.username!.isEmpty
                  ? Center(
                      child: Text("Server error\nPull to Refresh pase"),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.1,
                              child: Text(
                                controller.user!.name![0],
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            DetailsTile(
                              title: controller.user!.name.toString(),
                              subTitle: "Name",
                              icon: Icons.person,
                            ),
                            DetailsTile(
                              title: controller.user!.firstName.toString(),
                              subTitle: "First Name",
                              icon: Icons.create_sharp,
                            ),
                            DetailsTile(
                              title: controller.user!.lastName.toString(),
                              subTitle: "Last Name",
                              icon: Icons.create_sharp,
                            ),
                            DetailsTile(
                              title: controller.user!.username.toString(),
                              subTitle: "Username",
                              icon: Icons.account_box,
                            ),
                            DetailsTile(
                              title: controller.user!.email.toString(),
                              subTitle: "Email",
                              icon: Icons.contact_mail_outlined,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.updateUser();
                          },
                          child: Text("Update profile"),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
