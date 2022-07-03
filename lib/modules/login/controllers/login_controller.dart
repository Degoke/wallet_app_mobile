import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallet_app/common/mixins/repository_mixin.dart';
import 'package:wallet_app/modules/login/models/login_request.dart';
import 'package:wallet_app/modules/login/models/login_response.dart';
import 'package:wallet_app/modules/login/repository/login_repository.dart';
import 'package:wallet_app/routes/app_routes.dart';
import 'package:wallet_app/services/db_service.dart';

class LoginController extends GetxController
    with StateMixin<LoginResponse>, RepositoryMixin<LoginResponse> {
  final LoginRepository _loginRepository = Get.find();

  final NavigationService _navigationService = Get.find();
  final DbService _dbService = Get.find();

  Future<void> login({required String email, required String password}) async {
    loadingService.show('Logging in');

    return getData<LoginResponse>(
        () => _loginRepository
            .login(LoginRequest(email: email, password: password)),
        onData: (response) async {
        unawaited(_navigationService.clearStackAndShow(AppRoutes.DASHBOARD));
    });
  }

  void goToSignup() {
    _navigationService.replaceWith(AppRoutes.SIGNUP);
  }
}
