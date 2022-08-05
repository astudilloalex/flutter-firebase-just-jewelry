import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/sign_up/sign_up_controller.dart';
import 'package:just_jewelry/src/ui/routes/route_names.dart';
import 'package:just_jewelry/src/ui/utilities/overlay.dart';
import 'package:just_jewelry/src/ui/utilities/snackbar.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();
    return ElevatedButton(
      onPressed: () => _signUp(controller),
      child: Text('signUp'.tr),
    );
  }

  void _signUp(SignUpController controller) {
    if (!controller.formKey.currentState!.validate()) return;
    showOverlay(() async {
      final String? error = await controller.signUp();
      if (error != null) {
        showErrorSnackbar(error);
      } else {
        Get.offNamed(RouteNames.home);
      }
    });
  }
}
