import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/services/services.dart';

class SettingsController extends GetxController{

  MyServices myServices = Get.find();

  logout(){
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");

    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}