import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_jewelry/src/domain/domain.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard(this.category, {super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      onTap: () {},
      child: Center(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [
                    theme.primaryColor,
                    const Color(0xFFE2C696),
                  ],
                  transform: const GradientRotation(pi / 4),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            category.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2.0
                                ..color = theme.primaryColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            category.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (category.imageURL != null) const SizedBox(height: 10.0),
                    if (category.imageURL != null)
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: category.imageURL!,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
