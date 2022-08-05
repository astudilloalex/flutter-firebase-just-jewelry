import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/utilities/exception_to_string.dart';
import 'package:just_jewelry/src/ui/utilities/input_validation.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController({
    required this.authController,
    required this.inputValidation,
  });

  final AuthController authController;
  final InputValidation inputValidation;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  /// Communicate with [AuthController] to send email to the user.
  Future<String?> resetPassword() async {
    try {
      await authController.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      return null;
    } on FirebaseException catch (e) {
      return firebaseExceptionToString(e);
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
