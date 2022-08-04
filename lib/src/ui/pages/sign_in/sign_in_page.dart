import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/widgets/sign_in_button.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/widgets/sign_in_form.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/widgets/sign_in_google_button.dart';
import 'package:just_jewelry/src/ui/pages/sign_in/widgets/sign_in_header.dart';
import 'package:just_jewelry/src/ui/routes/route_names.dart';
import 'package:just_jewelry/src/ui/theme/app_theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 56.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SignInHeader(),
                  ),
                  const SizedBox(height: 20.0),
                  // Sign in form (email and password inputs).
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: SignInForm(),
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.toNamed(RouteNames.resetPassword),
                        child: Text(
                          'forgotYourPassword'.tr,
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  // Sign in button.
                  const Center(child: SignInButton()),
                  const SizedBox(height: 7.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Divider(thickness: 1.0),
                        ),
                        Expanded(
                          child: Text(
                            'or'.tr.toLowerCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Expanded(flex: 3, child: Divider(thickness: 1.0)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7.0),
                  // Sign in with Google Button.
                  const Center(child: SignInGoogleButton()),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
            // Footer of the page to sign up.
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: '${'doNotYouHaveAnAccountYet'.tr} ',
                  children: [
                    WidgetSpan(
                      child: InkWell(
                        onTap: () => Get.offNamed(RouteNames.signUp),
                        child: Text(
                          'signUp'.tr,
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
