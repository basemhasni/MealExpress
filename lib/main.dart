import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/bindings/initialbindings.dart';
import 'package:mealexpress/core/localization/changelocal.dart';

import 'core/constant/color.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",

        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColor.primaryColor),
          titleTextStyle:const  TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "PlayfairDisplay",
              fontSize: 25),
          backgroundColor: Colors.grey[50],
        ),


        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primaryColor
        ),


        textTheme: const TextTheme(

          displayLarge:  TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black),
            displayMedium:  TextStyle(
                fontWeight: FontWeight.bold, fontSize: 26,color: AppColor.black),

          bodyLarge:  TextStyle(
              height: 2,
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14),
            bodyMedium:  TextStyle(
                height: 2,
                color: AppColor.grey,
                fontSize: 14)

        ),

      ),
     initialBinding: InitialBindings(),
     // routes: routes,
      getPages: routes,
    );
  }
}





