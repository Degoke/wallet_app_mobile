import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:wallet_app/initializer.dart';
import 'package:wallet_app/routes/app_routes.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  await Initializer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wallet App',
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}
