import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    final int justIndex = 'welcomeToJustJewelry'.tr.indexOf('Just');
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'welcomeToJustJewelry'.tr.substring(0, justIndex),
              children: [
                TextSpan(
                  text: 'justJewelry'.tr,
                  style: theme.headerTextStyle?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
              style: theme.headerTextStyle?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
