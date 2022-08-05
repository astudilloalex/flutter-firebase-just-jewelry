import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_jewelry/src/app/app.dart';
import 'package:just_jewelry/src/ui/utilities/exception_to_string.dart';
import 'package:just_jewelry/src/ui/utilities/input_validation.dart';

class SignUpController extends GetxController {
  SignUpController({
    required this.authController,
    required this.inputValidation,
  });

  final AuthController authController;
  final InputValidation inputValidation;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool _visiblePassword = RxBool(false);
  final RxBool _visibleConfirmPassword = RxBool(false);

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void changeVisibleConfirmPassword() {
    _visibleConfirmPassword(!_visibleConfirmPassword.value);
  }

  void changeVisiblePassword() {
    _visiblePassword(!_visiblePassword.value);
  }

  /// Communicate with [AuthController] to sign up a new user.
  ///
  /// Returns a error message on exception, otherwise returns null.
  Future<String?> signUp() async {
    try {
      await authController.signUpWithEmailNameAndPassword(
        name: nameController.text.trim(),
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

  /// Verify if the
  String? validateConfirmPassword(String? confirmPassword) {
    if (confirmPassword == null || confirmPassword != passwordController.text) {
      return 'passwordDoNotMatch'.tr;
    }
    return null;
  }

  bool get visiblePassword => _visiblePassword.value;
  bool get visibleConfirmPassword => _visibleConfirmPassword.value;
}
