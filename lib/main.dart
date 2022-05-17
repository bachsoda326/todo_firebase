import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/firebase_options.dart';
import 'package:todo_firebase/frameworks/app_routes.dart' as routes;
import 'package:todo_firebase/pages/authentication_page.dart';
import 'package:todo_firebase/pages/home_page.dart';
import 'package:todo_firebase/pages/login/login_page.dart';
import 'package:todo_firebase/pages/test_1/bindings/test_1_binding.dart';
import 'package:todo_firebase/pages/test_1/test_1_page.dart';
import 'package:todo_firebase/pages/test_2/test_2_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      home: const AuthenticationPage(),
      getPages: [
        GetPage(name: routes.homeRoute, page: () => const HomePage()),
        GetPage(name: routes.loginRoute, page: () => const LoginPage()),
        GetPage(
          name: routes.test1Route,
          page: () => const Test1Page(),
          binding: Test1Binding(),
        ),
        GetPage(name: routes.test2Route, page: () => const Test2Page()),
      ],
    );
  }
}
