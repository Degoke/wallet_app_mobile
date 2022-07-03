import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoadingService extends GetxService {
  void show(String status) {
    EasyLoading.show(status: status);
  }

  void showToast(String status) {
    EasyLoading.showToast(status);
  }

  void showSuccess(String status) {
    EasyLoading.showSuccess(status);
  }

  void showError(String status) {
    EasyLoading.showError(status);
  }

  void showProgress(double progress, {String? status}) {
    EasyLoading.showProgress(progress, status: status);
  }

  void dismiss() {
    EasyLoading.dismiss();
  }
}
