import 'package:get/get.dart';
import 'package:wallet_app/common/models/error_response.dart';
import 'package:wallet_app/modules/signup/models/signup_request.dart';
import 'package:wallet_app/modules/signup/models/signup_response.dart';
import 'package:wallet_app/services/http_service.dart';

class SignupRepository {
  final GetConnect _connect = Get.find();

  Future signup(SignupRequest request) async {
    var response = await HttpService.postRequest(
        _connect, 'user/create/', request.toJson(),
        logMessage: 'Signup ${request.email}');

    if (response is ErrorResponse) {
      return response;
    } else {
      var signupResponse = SignupResponse.fromMap(response.body);
      return signupResponse;
    }
  }
}
