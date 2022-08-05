import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    final String title = 'enterYourEmail'.tr;
    return Column(
      children: [
        Text(
          title.substring(
            0,
            title.indexOf('email') - 1,
          ),
          style: theme.headerTextStyle?.copyWith(
            color: theme.primaryColor,
            fontSize: 36.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'email'.tr,
          style: theme.headerTextStyle?.copyWith(
            color: theme.primaryColor,
            fontSize: 36.0,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32.0),
        Text('receiveAnEmailToResetPassword'.tr),
      ],
    );
  }
}
