import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/reset_password/reset_password_controller.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
        Get.find<ResetPasswordController>();
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Form(
      key: controller.formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller.emailController,
        decoration: InputDecoration(
          labelText: 'email'.tr,
          prefixIcon: Icon(
            Icons.email_outlined,
            color: theme.primaryColor,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: controller.inputValidation.validateEmail,
      ),
    );
  }
}
