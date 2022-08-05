import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/sign_up/sign_up_controller.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: controller.nameController,
            decoration: InputDecoration(
              labelText: 'name'.tr,
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: theme.primaryColor,
              ),
            ),
            keyboardType: TextInputType.name,
            validator: controller.inputValidation.validateUsername,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
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
          const SizedBox(height: 16.0),
          Obx(() {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.passwordController,
              decoration: InputDecoration(
                labelText: 'password'.tr,
                prefixIcon: Icon(
                  Icons.lock_outline,
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
              obscureText: !controller.visiblePassword,
              validator: controller.inputValidation.validatePassword,
            );
          }),
          const SizedBox(height: 16.0),
          Obx(() {
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller.confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'confirmPassword'.tr,
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: theme.primaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: controller.changeVisibleConfirmPassword,
                  icon: Icon(
                    controller.visibleConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  color: theme.unfocusedColor,
                  splashRadius: 15.0,
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: !controller.visibleConfirmPassword,
              validator: controller.validateConfirmPassword,
            );
          }),
        ],
      ),
    );
  }
}
