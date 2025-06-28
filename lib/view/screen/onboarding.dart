import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/onboarding_controller.dart';
import 'package:mealexpress/view/widget/onboarding/custombutton.dart';
import 'package:mealexpress/view/widget/onboarding/customslider.dart';
import 'package:mealexpress/view/widget/onboarding/pointcontroller.dart';



class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return  const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomPointControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
