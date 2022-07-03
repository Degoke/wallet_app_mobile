import 'package:get/instance_manager.dart';
import 'package:wallet_app/modules/signup/repository/signup_repository.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupRepository>(() => SignupRepository(), fenix: true);
  }
}
