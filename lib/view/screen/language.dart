
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/localization/changelocal.dart';

import '../../core/constant/routes.dart';
import '../widget/language/custombuttonlang.dart';

class Language extends GetView<LocaleController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Fr",
                  onPressed: () {
                    controller.changeLang("fr");
                    Get.toNamed(AppRoute.onBoarding) ;
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoute.onBoarding) ;
                  }),
            ],
          )),
    );
  }
}
