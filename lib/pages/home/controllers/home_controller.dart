import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/frameworks/app_routes.dart' as routes;
import 'package:todo_firebase/utils/app_utils.dart';

class HomeController {
  void debugPrintUser() =>
      debugPrint(FirebaseAuth.instance.currentUser.toString());

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(routes.loginRoute);
    } catch (e) {
      AppUtils.showSnackBar('Sign out failed.');
    }
  }
}
