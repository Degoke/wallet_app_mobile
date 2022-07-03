// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:wallet_app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:wallet_app/modules/dashboard/views/dashboard_view.dart';
import 'package:wallet_app/modules/login/bindings/login_binding.dart';
import 'package:wallet_app/modules/login/views/login_view.dart';
import 'package:wallet_app/modules/signup/bindings/signup_binding.dart';
import 'package:wallet_app/modules/signup/views/signup_view.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupPage(),
      binding: SignupBinding(),
    )
  ];
}
