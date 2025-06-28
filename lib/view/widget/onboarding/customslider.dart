

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/onboarding_controller.dart';
import 'package:mealexpress/data/datasourse/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
          children: [
            const SizedBox(height: 30),
            Text(onBoardingList[i].title!,
                style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 50),
            Image.asset(
              onBoardingList[i].image!,
              width: 200,
              height: 250,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 50),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          ],
        ));
  }
}