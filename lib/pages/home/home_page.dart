import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/pages/home/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Home'),
        actions: [
          IconButton(
            onPressed: homeController.debugPrintUser,
            icon: const Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: homeController.signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(),
    );
  }
}
