import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/ui/pages/reset_password/widgets/reset_password_button.dart';
import 'package:just_jewelry/src/ui/pages/reset_password/widgets/reset_password_form.dart';
import 'package:just_jewelry/src/ui/pages/reset_password/widgets/reset_password_header.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ResetPasswordHeader(),
          ),
          SizedBox(height: 20.0),
          // Reset password form
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ResetPasswordForm(),
          ),
          SizedBox(height: 30.0),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ResetPasswordButton(),
            ),
          ),
        ],
      ),
    );
  }
}
