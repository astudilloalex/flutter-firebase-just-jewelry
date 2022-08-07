import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/domain/domain.dart';
import 'package:just_jewelry/src/ui/routes/route_names.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class HomeCarouselItem extends StatelessWidget {
  const HomeCarouselItem(this.jewel, {super.key});

  final Jewel jewel;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        Get.toNamed(
          RouteNames.productDetail,
          arguments: jewel,
          parameters: {'id': jewel.id ?? ''},
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    theme.primaryColor.withOpacity(0.05),
                    theme.primaryColor.withOpacity(0.9),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 1.425],
                  transform: const GradientRotation(math.pi),
                ).createShader(bounds);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  imageUrl: jewel.imageURLs.first,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Jewel name text.
            Positioned(
              right: 16.0,
              top: 10.0,
              child: Text(
                jewel.name.toUpperCase(),
                style: theme.headerTextStyle?.copyWith(
                  fontWeight: FontWeight.w700,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..color = theme.primaryColor,
                ),
              ),
            ),
            Positioned(
              right: 16.0,
              top: 10.0,
              child: Text(
                jewel.name.toUpperCase(),
                style: theme.headerTextStyle?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Discount text.
            Positioned(
              left: 16.0,
              bottom: 10.0,
              child: Text(
                jewel.discount == null
                    ? ''
                    : '${'discount'.tr} ${jewel.discount!.toStringAsFixed(0)}%',
                style: theme.headerTextStyle?.copyWith(
                  fontWeight: FontWeight.w700,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2.0
                    ..color = theme.primaryColor,
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              bottom: 10.0,
              child: Text(
                jewel.discount == null
                    ? ''
                    : '${'discount'.tr} ${jewel.discount!.toStringAsFixed(0)}%',
                style: theme.headerTextStyle?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
