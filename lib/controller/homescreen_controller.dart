import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/view/offers.dart';
import 'package:mealexpress/view/screen/home.dart';
import 'package:mealexpress/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    //NotificationView(),
    OffersView(),
    Settings()
  ];

  List bottomappbar = [
    {"title": "42".tr, "icon": Icons.home},
    //{"title": "notifications", "icon": Icons.notification_add_outlined},
    {"title": "offers", "icon": Icons.local_offer_outlined},
    {"title": "43".tr, "icon": Icons.settings},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
