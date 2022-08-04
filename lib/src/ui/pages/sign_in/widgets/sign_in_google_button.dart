import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/sign_in_controller.dart';
import 'package:just_jewelry/src/ui/routes/route_names.dart';
import 'package:just_jewelry/src/ui/utilities/overlay.dart';
import 'package:just_jewelry/src/ui/utilities/snackbar.dart';

class SignInGoogleButton extends StatelessWidget {
  const SignInGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    return OutlinedButton.icon(
      onPressed: () => _signInWithGoogle(controller),
      icon: Image.asset(
        'assets/images/google_icon.png',
        width: 28.0,
        height: 28.0,
      ),
      label: Text('signInWithGoogle'.tr),
    );
  }

  // Communicate with controller to sign in to the app with Google.
  void _signInWithGoogle(SignInController controller) {
    showOverlay(() async {
      final String? error = await controller.signInWithGoogle();
      if (error != null) {
        showErrorSnackbar(error);
      } else {
        Get.offNamed(RouteNames.home);
      }
    });
  }
}
