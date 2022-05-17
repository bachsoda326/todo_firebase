import 'package:get/get.dart';
import 'package:todo_firebase/pages/test_1/controller/test_1_controller.dart';

class Test1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Test1Controller>(() => Test1Controller());
  }
}