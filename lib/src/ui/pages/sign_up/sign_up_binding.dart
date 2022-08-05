import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/pages/sign_up/sign_up_controller.dart';
import 'package:just_jewelry/src/ui/utilities/input_validation.dart';

class SignUpBinding implements Bindings {
  const SignUpBinding();

  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(
        authController: Get.find<AuthController>(),
        inputValidation: const InputValidation(),
      ),
    );
  }
}
