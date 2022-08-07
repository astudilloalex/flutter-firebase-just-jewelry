import 'package:get/get.dart';
import 'package:just_jewelry/src/data/data.dart';
import 'package:just_jewelry/src/ui/pages/home/home_controller.dart';
import 'package:just_jewelry/src/ui/pages/home/widgets/app_bar/home_app_bar_controller.dart';

class HomeBinding implements Bindings {
  const HomeBinding();

  @override
  void dependencies() {
    const JewelFirebase jewelFirebase = JewelFirebase();
    Get.lazyPut<HomeAppBarController>(
      () => HomeAppBarController(jewelFirebase: jewelFirebase),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(
        categoryFirebase: const CategoryFirebase(),
        jewelFirebase: jewelFirebase,
      ),
    );
  }
}
