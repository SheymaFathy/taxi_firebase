import 'package:fb_taxi/res/color_manager.dart';
import 'package:get/get.dart';

SnackbarController snackbarDef(String title, String message) {
  return Get.snackbar(title, message,
      backgroundColor: ColorManager.primary,
      colorText: ColorManager.black,
      animationDuration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM);
}
