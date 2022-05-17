import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/pages/test_1/controller/test_1_controller.dart';

class Test1Page extends StatelessWidget {
  const Test1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Test1Controller>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/test2'),
          child: Text('To test 2 \n${controller.count}'),
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: controller.increase),
    );
  }
}
