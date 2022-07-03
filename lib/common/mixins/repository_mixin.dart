import 'package:get/get.dart';
import 'package:wallet_app/common/models/error_response.dart';
import 'package:wallet_app/services/loading_service.dart';
import 'package:wallet_app/utils/logger.dart';

mixin RepositoryMixin<T> on StateMixin<T> {
  final LoadingService loadingService = Get.find();

  Future<void> getData<V>(
    Future Function() repositoryCall, {
    void Function(V data)? onData,
    void Function(ErrorResponse errorResponse)? onErrorResponse,
    void Function(dynamic e)? onFailure,
  }) async {
    try {
      var response = await repositoryCall();

      if (response is ErrorResponse) {
        logger.d('Response is Error Response');

        if (onErrorResponse != null) {
          onErrorResponse(response);
        }
        loadingService.showToast(response.message);
      } else {
        if (onData != null) {
          onData(response);
        }
      }
    } catch (error) {
      logger.e(error);
      if (onFailure != null) {
        onFailure(error);
      }
      loadingService.showToast(
          'An error occured.\nPlease check your internet connection.');
      rethrow;
    } finally {
      loadingService.dismiss();
    }
  }
}
