import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app_binding.dart';

export 'controllers/auth_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      initialBinding: AppBinding(),
    );
  }
}
