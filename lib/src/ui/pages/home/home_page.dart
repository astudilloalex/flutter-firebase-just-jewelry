import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/app_bar/home_app_bar.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/categories/home_category_list.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/home_jewel_list.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/home_search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HomeAppBar(),
            const SliverToBoxAdapter(
              child: HomeSearchBox(),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 10.0),
              sliver: SliverToBoxAdapter(
                child: Text('categories'.tr),
              ),
            ),
            const SliverToBoxAdapter(
              child: HomeCategoryList(),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              sliver: SliverToBoxAdapter(
                child: Text('recentProducts'.tr),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              sliver: HomeJewelList(),
            ),
          ],
        ),
      ),
    );
  }
}
