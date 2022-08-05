import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/pages/reset_password/reset_password_controller.dart';
import 'package:just_jewelry/src/ui/utilities/input_validation.dart';

class ResetPasswordBinding implements Bindings {
  const ResetPasswordBinding();

  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(
        authController: Get.find<AuthController>(),
        inputValidation: const InputValidation(),
      ),
    );
  }
}
