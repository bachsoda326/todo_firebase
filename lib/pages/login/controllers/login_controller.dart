import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/frameworks/app_routes.dart' as routes;
import 'package:todo_firebase/utils/app_utils.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginAnonymous() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      debugPrint('Signed in with temporary account. $userCredential');

      AppUtils.showSnackBar('Login as Anonymous successfully.');
      Get.offAllNamed(routes.homeRoute);
    } on FirebaseAuthException catch (e) {
      AppUtils.showSnackBar(e.message ?? 'Login failed');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      EasyLoading.show(maskType: EasyLoadingMaskType.black);
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        debugPrint(credential.toString());

        AppUtils.showSnackBar('Login success.');
        Get.offAllNamed(routes.homeRoute);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AppUtils.showSnackBar('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          AppUtils.showSnackBar('Wrong password provided for that user.');
        } else {
          AppUtils.showSnackBar(e.message ?? 'Login failed');
        }
      } finally {
        EasyLoading.dismiss();
      }
    }
  }
}
