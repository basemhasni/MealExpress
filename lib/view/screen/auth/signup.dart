
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/auth/signup_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/functions/alertexitapp.dart';
import 'package:mealexpress/core/functions/validinput.dart';
import 'package:mealexpress/view/widget/auth/textsignuporlogin.dart';

import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('13'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
       onWillPop: alertExitApp,
      child: GetBuilder<SignUpControllerImp>(builder: (controller) =>
        HandlingDataRequest(statusRequest: controller.statusRequest!, widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              const SizedBox(height: 20) ,
               CustomTextTitleAuth(text: "9".tr),
              const SizedBox(height: 10),
               CustomTextBodyAuth(
                  text:
                  "10".tr),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                hinttext: "16".tr,
                valid: (val) {
                  return validInput(val!, 5, 60, "username");
                },
                isNumber: false,
                iconData: Icons.person_outline,
                labeltext: "Username",
                mycontroller: controller.username,
              ),
              CustomTextFormAuth(
                hinttext: "15".tr,
                valid: (val) {
                  return validInput(val!, 5, 60, "email");
                },
                isNumber: false,
                iconData: Icons.email_outlined,
                labeltext: "Email",
                mycontroller: controller.email,
              ),
              CustomTextFormAuth(
                hinttext: "17".tr,
                valid: (val) {
                  return validInput(val!, 5, 15, "phone");

                },
                isNumber: true,
                iconData: Icons.phone,
                labeltext: "Phone",
                mycontroller:controller.phone ,
              ),
              CustomTextFormAuth(
                hinttext: "14".tr,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                isNumber: false,
                obscureText: controller.isshowpassword,
                onTapIcon: (){
                  controller.showPassword();
                },
                iconData: Icons.lock_outline,
                labeltext: "Password",
                mycontroller: controller.password,
              ),

              CustomButtonAuth(text: "13", onPressed: () {
                controller.signUp();
              }),
              SizedBox(height: 30),
              CustomTextSignUpOrSignIn(textone:"18".tr ,
                texttwo: "Sign In",
                onTap: (){
                  controller.goToSignIn();
                },
              )


            ]),
          ),
        ))
        )
      )
    );
  }
}