import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/firebase_options.dart';
import 'package:todo_firebase/frameworks/app_routes.dart' as routes;
import 'package:todo_firebase/pages/home/bindings/home_binding.dart';
import 'package:todo_firebase/pages/home/home_page.dart';
import 'package:todo_firebase/pages/login/bindings/login_binding.dart';
import 'package:todo_firebase/pages/login/login_page.dart';
import 'package:todo_firebase/pages/signup/bindings/signup_binding.dart';
import 'package:todo_firebase/pages/signup/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Todo Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? routes.homeRoute
          : routes.loginRoute,
      getPages: [
        GetPage(
          name: routes.homeRoute,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: routes.loginRoute,
          page: () => const LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: routes.signupRoute,
          page: () => const SignupPage(),
          binding: SignupBinding(),
        ),
      ],
    );
  }
}
