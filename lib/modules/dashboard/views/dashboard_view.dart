import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/routes/app_routes.dart';

import '../controllers/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Wallet App'),
        ),
        body: ListView(
          children: <Widget>[
            Text('Hello ${controller.currentUser.value?.email ?? ''}'),
            FloatingActionButton(
              child: Text('Change'),
              onPressed: () => Get.toNamed(AppRoutes.LOGIN),
            ),
          ],
        ),
      );
    });
  }
}
