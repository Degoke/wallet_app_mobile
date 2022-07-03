import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:wallet_app/common/models/error_response.dart';
import 'package:wallet_app/modules/login/models/login_response.dart';
import 'package:wallet_app/services/db_service.dart';
import 'package:wallet_app/services/user_service.dart';
import 'package:wallet_app/utils/logger.dart';

class HttpService {
  static Future postRequest(
    GetConnect connect,
    String endpoint,
    dynamic body, {
    Map<String, String>? headers,
    String? logMessage,
  }) async {
    logger.d(logMessage);
    logger.d(body);
    logger.d(endpoint);
    try {
      var response = await connect.post(endpoint, body, headers: headers ?? {});
      logger.v('${response.request?.url}\n${response.request?.headers}');
      logger.v(response.body);
      logger.v(response.statusCode);
      logger.v(response.status);
      logger.v(response.statusText);

      if (response.body != null &&
          !response.hasError &&
          response.body['status'] != 'error') {
        return response;
      } else {
        if (response.body == null) {
          throw ('Something Went wrong');
        } else if (response.body['status'] == 'error') {
          if (response.body['message'] is String) {
            return ErrorResponse.fromMap(response.body);
          } else {
            if (response.body['message']['non_field_errors'] != null) {
              response.body['message'] =
                  response.body['message']['non_field_errors'][0];
              return ErrorResponse.fromMap(response.body);
            } else if (response.body['message']['email'] != null) {
              response.body['message'] = response.body['message']['email'][0];
              return ErrorResponse.fromMap(response.body);
            } else {
              throw ('something went wrong');
            }
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> UpdateUserOperations(LoginResponse response) async {
    var dbService = Get.find<DbService>();
    var connect = Get.find<GetConnect>();
    var userService = Get.find<UserService>();

    await dbService.saveUser(response.data.user);
    userService.currentUser(response.data.user);

    var access = response.data.access;
    var refresh = response.data.refresh;
    logger.d('updateuserOperations $access');

    if (access.isNotEmpty && access != 'null') {
      await dbService.setAccessToken(access);
    }

    if (refresh.isNotEmpty && refresh != 'null') {
      await dbService.setRefreshToken(refresh);
    }

    connect.httpClient.addRequestModifier<Object?>((request) {
      request.headers['Authorization'] = 'Bearer $access';
      return request;
    });
    Get.put(connect);
  }

  static void clearHeaders(GetConnect connect) {
    var dbService = Get.find<DbService>();

    var token = dbService.accessToken;
    connect.httpClient.removeRequestModifier<Object?>((request) {
      request.headers['Authorization'] = 'bearer $token';
      return request;
    });
  }
}
// {
//       String? logMessage,
//       Map<String, String>? headers,
//       Map<String, dynamic>? query,
//       String? contentType,
//       bool showLogs = true,
//     }