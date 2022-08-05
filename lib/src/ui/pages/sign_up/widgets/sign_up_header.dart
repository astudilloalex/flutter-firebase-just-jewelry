import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

/// Header of the sign up page.
class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Column(
      children: [
        Text(
          'just'.tr,
          style: theme.headerTextStyle?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 36.0,
          ),
        ),
        Text(
          'jewelry'.tr,
          style: theme.headerTextStyle?.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 36.0,
          ),
        ),
        const SizedBox(height: 32.0),
        Text('signUpYourAccount'.tr),
      ],
    );
  }
}
