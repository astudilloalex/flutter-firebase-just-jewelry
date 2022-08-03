import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/routes/route_names.dart';

class SplashController extends GetxController {
  SplashController({
    required this.authController,
  });

  final AuthController authController;

  final RxBool _loading = RxBool(true);

  Future<String> get route async {
    try {
      await authController.loadCurrentUser();
      if (authController.userDetail == null) return RouteNames.signIn;
      return RouteNames.home;
    } on Exception {
      return RouteNames.signIn;
    } finally {
      _loading(false);
    }
  }

  bool get loading => _loading.value;
}
