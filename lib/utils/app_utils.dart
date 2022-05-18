import 'package:get/get.dart';

class AppUtils {
  static showSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 500),
    ));
  }
}