import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wallet_app/common/models/user.dart';

class UserService extends GetxService {
  Rxn<User> currentUser = Rxn<User>();
}
