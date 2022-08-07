import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class HomeSearchBox extends StatelessWidget {
  const HomeSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Stack(
      children: [
        Positioned(
          top: -240.0,
          bottom: -(MediaQuery.of(context).size.height - 240.0),
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
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: theme.scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 0.0,
              color: Colors.transparent,
              margin: EdgeInsets.zero,
              child: SizedBox(
                height: 40.0,
                child: ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  tileColor: theme.searchTileBackgroundColor,
                  title: Text(
                    'findRingsNecklacesPendantsEtc'.tr,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: theme.unfocusedColor,
                    ),
                  ),
                  trailing: const Icon(Icons.search_outlined),
                  visualDensity: const VisualDensity(vertical: -4.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
