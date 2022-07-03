import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wallet_app/config.dart';
import 'package:wallet_app/services/db_service.dart';
import 'package:wallet_app/services/loading_service.dart';
import 'package:wallet_app/services/user_service.dart';
import 'package:wallet_app/utils/logger.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initServices();
      _initGetConnect();
    } catch (error) {
      rethrow;
    }
  }

  static Future<void> _initServices() async {
    logger.d('starting ,services...');

    Get.put(NavigationService(), permanent: true);
    Get.put(LoadingService(), permanent: true);
    await Get.putAsync<DbService>(() => DbService().init());

    logger.v('All services started');
  }

  static void _initGetConnect() async {
    var connect = GetConnect();
    var url = ConfigEnviroments.getEnviroments()['url'];

    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 20);
    connect.httpClient.maxAuthRetries = 0;

    logger.i('connected to $url');
    Get.put(connect, permanent: true);
  }
}
