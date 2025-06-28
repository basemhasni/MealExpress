

import 'package:get/get.dart';
import 'package:mealexpress/core/services/services.dart';

TranslateDatabase(columnfr, columnen) {
  MyServices myServices = Get.find();

  if (myServices.sharedPreferences.getString("lang") == "fr") {
    return columnfr;
  } else {
    return columnen;
  }
}