import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/sign_in_controller.dart';
import 'package:just_jewelry/src/ui/utilities/input_validation.dart';

class SignInBinding implements Bindings {
  const SignInBinding();

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(
        authController: Get.find<AuthController>(),
        inputValidation: const InputValidation(),
      ),
    );
  }
}
