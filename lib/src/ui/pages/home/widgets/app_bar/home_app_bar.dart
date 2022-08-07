import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/app_bar/widgets/home_carousel.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    final int justIndex = 'welcomeToJustJewelry'.tr.indexOf('Just');
    return SliverAppBar(
      title: Text.rich(
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
      expandedHeight: 240.0,
      flexibleSpace: SizedBox(
        height: 240.0,
        child: Stack(
          children: [
            Positioned(
              top: 0.0,
              bottom: -(MediaQuery.of(context).size.height - 200.0),
              right: 0.0,
              left: 0.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.primaryColor,
                      theme.primaryColor,
                      const Color(0xFFD1B98F),
                    ],
                    stops: const <double>[0.4314, 0.4315, 1.0772],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    transform: const GradientRotation(3 * math.pi / 20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 17.0,
              left: 8.0,
              child: Image.asset('assets/images/gold_elipses_frame.png'),
            ),
            Positioned(
              top: 53.0,
              left: 70.0,
              child: Image.asset('assets/images/diamond_ring.png'),
            ),
            Positioned(
              top: 40.0,
              right: -70.0,
              child: Image.asset('assets/images/diamond.png'),
            ),
            const Positioned(
              top: 60.0,
              right: 0.0,
              left: 0.0,
              child: HomeCarousel(),
            ),
          ],
        ),
      ),
    );
  }
}
