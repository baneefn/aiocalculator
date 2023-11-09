import 'package:get/instance_manager.dart';
import 'package:utspemob/controller/calculate_controller.dart';
import 'package:utspemob/controller/theme_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculateController());
    Get.lazyPut(() => ThemeController());
  }
}
