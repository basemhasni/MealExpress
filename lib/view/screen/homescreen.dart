
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/homescreen_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/view/widget/home/custombottomappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
              onPressed: () {Get.toNamed(AppRoute.cart);},
              child: const Icon(Icons.shopping_basket_outlined)),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: WillPopScope(child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () {
            Get.defaultDialog(title: "Warning",
                titleStyle:const TextStyle(fontWeight: FontWeight.bold,color:AppColor.primaryColor ),
                middleText: "Do You Want To Exit The app",
              onCancel: () {},
              onConfirm: () {exit(0);},
              cancelTextColor: AppColor.secondColor,
              confirmTextColor: AppColor.secondColor,
              buttonColor: AppColor.thirdColor
            );
                return Future.value(false);
              },),
        ));
  }
}
