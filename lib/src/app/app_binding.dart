import 'package:get/get.dart';
import 'package:just_jewelry/src/app/controllers/auth_controller.dart';

class AppBinding implements Bindings {
  const AppBinding();

  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
