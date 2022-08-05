import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/reset_password/reset_password_controller.dart';
import 'package:just_jewelry/src/ui/utilities/overlay.dart';
import 'package:just_jewelry/src/ui/utilities/snackbar.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
        Get.find<ResetPasswordController>();
    return ElevatedButton.icon(
      icon: const Icon(Icons.send_outlined),
      onPressed: () => _resetPassword(controller),
      label: Text('resetPassword'.tr),
    );
  }

  void _resetPassword(ResetPasswordController controller) {
    if (!controller.formKey.currentState!.validate()) return;
    showOverlay(() async {
      final String? error = await controller.resetPassword();
      if (error != null) {
        showErrorSnackbar(error);
      } else {
        showSuccessSnackbar('passwordResetEmailSent'.tr);
        Get.until((route) => route.isFirst);
      }
    });
  }
}
