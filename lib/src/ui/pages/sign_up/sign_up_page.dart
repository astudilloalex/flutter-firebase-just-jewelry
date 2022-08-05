import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/sign_up/widgets/sign_up_button.dart';
import 'package:just_jewelry/src/ui/pages/sign_up/widgets/sign_up_form.dart';
import 'package:just_jewelry/src/ui/pages/sign_up/widgets/sign_up_header.dart';
import 'package:just_jewelry/src/ui/routes/route_names.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: const [
                  SizedBox(height: 56.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SignUpHeader(),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SignUpForm(),
                  ),
                  SizedBox(height: 30.0),
                  // Sign in button.
                  Center(child: SignUpButton()),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
            // Footer of the page to navigate to sign in.
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: '${'alreadyHaveAnAccount'.tr} ',
                  children: [
                    WidgetSpan(
                      child: InkWell(
                        onTap: () => Get.offNamed(RouteNames.signIn),
                        child: Text(
                          'signIn'.tr,
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
