import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/frameworks/app_routes.dart' as routes;
import 'package:todo_firebase/utils/app_utils.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint(credential.toString());
        // To Home page after signup successfully.
        Get.offAllNamed(routes.homeRoute);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AppUtils.showSnackBar('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AppUtils.showSnackBar('The account already exists for that email.');
        } else {
          AppUtils.showSnackBar(e.message ?? 'Signup failed.');
        }
      } catch (e) {
        AppUtils.showSnackBar(e.toString());
      }
    }
  }
}
