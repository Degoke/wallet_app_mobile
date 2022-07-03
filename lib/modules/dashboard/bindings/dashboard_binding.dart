import 'package:get/get.dart';
import 'package:wallet_app/services/user_service.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.put(UserService(), permanent: true);
  }
}
