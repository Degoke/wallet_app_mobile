import 'package:get/instance_manager.dart';
import 'package:wallet_app/modules/login/repository/login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRepository>(() => LoginRepository(), fenix: true);
  }
}
