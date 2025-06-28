import 'package:get/get.dart';
import 'package:mealexpress/controller/creditcard_controller.dart';
import 'package:mealexpress/core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }

  BindingsBuilder() {
  Get.put(SharedPreferencesController());
  }




}