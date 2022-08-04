import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/sign_in_controller.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          // Email text form field.
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.emailController,
            decoration: InputDecoration(
              labelText: 'email'.tr,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: controller.inputValidation.validateEmail,
          ),
          const SizedBox(height: 16.0),
          // Password input with Obx to change password visibility state.
          Obx(() {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.passwordController,
              obscureText: !controller.visiblePassword,
              decoration: InputDecoration(
                labelText: 'password'.tr,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: theme.primaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: controller.changeVisiblePassword,
                  icon: Icon(
                    controller.visiblePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  color: theme.unfocusedColor,
                  splashRadius: 15.0,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              validator: controller.inputValidation.validatePassword,
            );
          }),
        ],
      ),
    );
  }
}
