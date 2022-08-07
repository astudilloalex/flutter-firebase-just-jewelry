import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/home/home_controller.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/categories/home_category_card.dart';
import 'package:just_jewelry/src/ui/utilities/snackbar.dart';
import 'package:just_jewelry/src/ui/widgets/progress_indicators/custom_progress_indicator.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.loadingCategories) {
            return const CustomProgressIndicator();
          }
          return ListView.builder(
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? 16.0 : 0.0,
                  0.0,
                  10.0,
                  0.0,
                ),
                child: HomeCategoryCard(
                  controller.categories[index],
                ),
              );
            },
          );
        },
        didChangeDependencies: (state) async {
          final String? error = await state.controller!.loadCategories();
          if (error != null) showErrorSnackbar(error);
        },
        id: 'categories',
      ),
    );
  }
}
