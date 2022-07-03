import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:wallet_app/common/constants/storage_constants.dart';
import 'package:wallet_app/common/models/user.dart';
import 'package:wallet_app/utils/logger.dart';

class DbService extends GetxService {
  final _box = GetStorage();

  Future<void> saveUser(User user) async {
    logger.i('save user ${user.id} ${user.email}');
    await _box.write(StorageConstants.CURRENT_USER, user.toJson());
  }

  Future<void> clearDB() async {
    await _box.erase();
    logger.d('DB Cleared');
  }

  Future<bool> setAccessToken(String token) async {
    if (token.isNotEmpty) {
      await _box.write(StorageConstants.ACCESS_TOKEN, token);
      return true;
    }
    return false;
  }

  Future<bool> setRefreshToken(String token) async {
    if (token.isNotEmpty) {
      await _box.write(StorageConstants.REFRESH_TOKEN, token);
      return true;
    }
    return false;
  }

  User? get currentUser {
    try {
      return User.fromJson(_box.read(StorageConstants.CURRENT_USER));
    } catch (error) {
      logger.e(error);
      return null;
    }
  }

  String? get accessToken {
    try {
      return _box.read<String>(StorageConstants.ACCESS_TOKEN);
    } catch (e) {
      return null;
    }
  }

  String? get refreshToken {
    try {
      return _box.read<String>(StorageConstants.REFRESH_TOKEN);
    } catch (e) {
      return null;
    }
  }

  bool get tokenExpired {
    var result = true;
    try {
      result =
          (accessToken == null || accessToken!.isEmpty || JwtDecoder.isExpired(accessToken!));
      logger.d('token expired: $result');
    } catch (e) {
      logger.e(e);
    }
    return result;
  }

  Future<DbService> init() async {
    super.onInit();

    logger.i('Strarting Db service');
    await GetStorage.init();

    logger.d('Started DbService successfully');

    return this;
  }
}
