import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:wallet_app/common/models/user.dart';
import 'package:wallet_app/services/db_service.dart';
import 'package:wallet_app/services/user_service.dart';

class DashboardController extends GetxController {
  final DbService _dbService = Get.find();
  final UserService _userService = Get.find();
  var username = 'Degoke'.obs;

  Rxn<User> get currentUser => _userService.currentUser;

  void changeUsername(String name) {
    username.value = name;
  }
}
