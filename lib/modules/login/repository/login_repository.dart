import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:wallet_app/common/models/error_response.dart';
import 'package:wallet_app/modules/login/models/login_request.dart';
import 'package:wallet_app/modules/login/models/login_response.dart';
import 'package:wallet_app/services/db_service.dart';
import 'package:wallet_app/services/http_service.dart';
import 'package:wallet_app/utils/logger.dart';

class LoginRepository {
  final GetConnect _connect = Get.find();

  Future login(LoginRequest request) async {
    var response = await HttpService.postRequest(_connect, 'user/login/', request.toJson(),
        logMessage: 'Login ${request.email}');

    if (response is ErrorResponse) {
      return response;
    } else {
      var loginResponse = LoginResponse.fromMap(response.body);
      await HttpService.UpdateUserOperations(loginResponse);
      return loginResponse;
    }
  }
}
