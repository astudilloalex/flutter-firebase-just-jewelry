import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/home/home_controller.dart';
import 'package:just_jewelry/src/ui/utilities/snackbar.dart';
import 'package:just_jewelry/src/ui/widgets/jewel_card/jewel_card.dart';

class HomeJewelList extends StatelessWidget {
  const HomeJewelList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      didChangeDependencies: (state) async {
        final String? error = await state.controller!.loadJewels();
        if (error != null) showErrorSnackbar(error);
      },
      id: 'jewels',
      builder: (controller) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 154.0,
            mainAxisExtent: 180.0,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (_, index) {
              return JewelCard(jewel: controller.jewels[index]);
            },
            childCount: controller.jewels.length,
          ),
        );
      },
    );
  }
}
