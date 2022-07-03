import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallet_app/common/mixins/repository_mixin.dart';
import 'package:wallet_app/modules/signup/models/signup_request.dart';
import 'package:wallet_app/modules/signup/models/signup_response.dart';
import 'package:wallet_app/modules/signup/repository/signup_repository.dart';
import 'package:wallet_app/routes/app_routes.dart';

class SignupController extends GetxController
    with StateMixin<SignupResponse>, RepositoryMixin<SignupResponse> {
  final SignupRepository _signupRepository = Get.find();

  final NavigationService _navigationService = Get.find();

  Future<void> signup(
      {required String first_name,
      required String last_name,
      required String email,
      required String password}) {
    loadingService.show('Signing Up');

    return getData<SignupResponse>(
        () => _signupRepository.signup(SignupRequest(
            first_name: first_name,
            last_name: last_name,
            email: email,
            password: password)), onData: (response) async {
      unawaited(_navigationService.clearStackAndShow(AppRoutes.LOGIN));
    });
  }

  void goToLogin() {
    _navigationService.replaceWith(AppRoutes.LOGIN);
  }
}
