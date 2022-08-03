import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/pages/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  const SplashBinding();

  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(
        authController: Get.find<AuthController>(),
      ),
    );
  }
}
