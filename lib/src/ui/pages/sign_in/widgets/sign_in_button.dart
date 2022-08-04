import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/sign_in_controller.dart';
import 'package:just_jewelry/src/ui/routes/route_names.dart';
import 'package:just_jewelry/src/ui/utilities/overlay.dart';
import 'package:just_jewelry/src/ui/utilities/snackbar.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return ElevatedButton(
      onPressed: () => _signIn(controller),
      child: Text('signIn'.tr),
    );
  }

  // Communicate with controller to sign in to the app.
  void _signIn(SignInController controller) {
    if (!controller.formKey.currentState!.validate()) return;
    showOverlay(() async {
      final String? error = await controller.signIn();
      if (error != null) {
        showErrorSnackbar(error);
      } else {
        Get.offNamed(RouteNames.home);
      }
    });
  }
}
