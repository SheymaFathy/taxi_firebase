import 'package:fb_taxi/screen/auth/auth_controller.dart';
import 'package:fb_taxi/screen/trip/trip_controller.dart';
import 'package:get/get.dart';


class BindingDef implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TripController(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
