import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/splash/splash_controller.dart';
import 'package:just_jewelry/src/ui/widgets/progress_indicators/custom_progress_indicator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/diamond_gold.png',
                width: 200.0,
                color: Colors.white,
              ),
            ),
            Text(
              'justJewelry'.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            GetX<SplashController>(
              didChangeDependencies: (state) async {
                Get.offNamed(await state.controller!.route);
              },
              builder: (controller) {
                if (controller.loading) {
                  return const CustomProgressIndicator(
                    color: Colors.white,
                    animationColor: Color(0xFFAEAF7A),
                    showText: false,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
