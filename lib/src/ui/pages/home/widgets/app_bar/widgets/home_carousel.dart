import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/app_bar/home_app_bar_controller.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/app_bar/widgets/home_carousel_item.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';
import 'package:just_jewelry/src/ui/utilities/snackbar.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<HomeAppBarController>(
          didChangeDependencies: (state) async {
            final String? error = await state.controller!.load();
            if (error != null) showErrorSnackbar(error);
          },
          id: 'carousel',
          builder: (controller) {
            return CarouselSlider(
              items: List.generate(controller.jewels.length, (index) {
                return HomeCarouselItem(controller.jewels[index]);
              }),
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                height: 150,
                enlargeCenterPage: true,
                onPageChanged: controller.onPageChanged,
              ),
            );
          },
        ),
        GetBuilder<HomeAppBarController>(
          id: 'carouselindicator',
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                controller.jewels.length,
                (index) {
                  return Container(
                    width: controller.currentIndex != index ? 9.0 : 18.0,
                    height: 9.0,
                    decoration: BoxDecoration(
                      color: controller.currentIndex != index
                          ? theme.unfocusedColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ),
                      border: Border.all(color: theme.primaryColor),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 3.0,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
