import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_firebase/pages/test_1/controller/test_1_controller.dart';

class Test2Page extends StatelessWidget {
  const Test2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Test1Controller controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 2'),
      ),
      body: Center(
        child: Text('${controller.count}'),
      ),
    );
  }
}
