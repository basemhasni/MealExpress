import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/functions/fcmconfig.dart';

import '../services/services.dart';

class LocaleController extends GetxController{

  Locale? language ;

  MyServices myServices = Get.find()  ;


  changeLang(String langcode){
    Locale locale = Locale(langcode) ;
    myServices.sharedPreferences.setString("lang", langcode) ;
    Get.updateLocale(locale) ;
  }


  @override
  void onInit() {
    requestPermissionNotification();
    fcmconfig();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang") ;
    if (sharedPrefLang == "fr"){
      language = const Locale("fr")  ;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en")  ;
    }else {
      language = Locale(Get.deviceLocale!.languageCode) ;
    }
    super.onInit();
  }

}