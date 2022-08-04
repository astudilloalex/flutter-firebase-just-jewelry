import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/utilities/exception_to_string.dart';
import 'package:just_jewelry/src/ui/utilities/input_validation.dart';

class SignInController extends GetxController {
  SignInController({
    required this.authController,
    required this.inputValidation,
  });

  final AuthController authController;
  final InputValidation inputValidation;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool _visiblePassword = RxBool(false);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void changeVisiblePassword() {
    _visiblePassword(!_visiblePassword.value);
  }

  /// Communicate with [AuthController] to sign in with email and password.
  ///
  /// Returns a error message on exception, otherwise returns null.
  Future<String?> signIn() async {
    try {
      await authController.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      if (authController.userDetail == null) {
        return 'anUnexpectedErrorHasOccurred'.tr;
      }
    } on FirebaseException catch (e) {
      return firebaseExceptionToString(e);
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  /// Communicate with [AuthController] to sign in with Google.
  ///
  /// Returns a error message on exception, otherwise returns null.
  Future<String?> signInWithGoogle() async {
    try {
      await authController.signInWithGoogle();
      if (authController.userDetail == null) {
        return 'anUnexpectedErrorHasOccurred'.tr;
      }
    } on FirebaseException catch (e) {
      return firebaseExceptionToString(e);
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  bool get visiblePassword => _visiblePassword.value;
}
