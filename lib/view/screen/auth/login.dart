

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/auth/login_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/functions/alertexitapp.dart';
import 'package:mealexpress/core/functions/validinput.dart';

import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textsignuporlogin.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("8".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller) =>
            HandlingDataRequest (statusRequest: controller.statusRequest!, widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(children: [
                const LogoAuth(),
                const SizedBox(height: 20) ,
                const CustomTextTitleAuth(text: "9"),
                const SizedBox(height: 10),
                const CustomTextBodyAuth(
                    text:
                    "10"),
                const SizedBox(height: 15),
                CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 60, "email");
                  },
                  isNumber: false,
                  hinttext: "15".tr,
                  iconData: Icons.email_outlined,
                  labeltext: "Email",
                  mycontroller: controller.email ,
                ),
                GetBuilder<LoginControllerImp>(builder: (controller) => CustomTextFormAuth(
                  valid: (val) {
                    return validInput(val!, 5, 30, "password");
                  },
                  isNumber: false,
                  obscureText: controller.isshowpassword,
                  onTapIcon: (){
                    controller.showPassword();
                  },
                  hinttext: "14".tr,
                  iconData: Icons.lock_outline,
                  labeltext: "Password",
                  mycontroller: controller.password,
                ),),
                InkWell(
                  onTap: () {
                    controller.goToForgetPassword();
                  },
                  child:  Text(
                    "11".tr,
                    textAlign: TextAlign.end,
                  ),
                ),
                CustomButtonAuth(text: "8", onPressed: () {
                  controller.login();
                }),
                SizedBox(height: 30),
                CustomTextSignUpOrSignIn(textone: "12".tr,
                  texttwo: "13".tr,
                  onTap: () {
                    controller.goToSignUp();

                  },
                )
              ]),
            ),
          ))
        ), )
    );
  }
}
