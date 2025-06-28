

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/forgetpassword/resetpassword_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/functions/validinput.dart';
import 'package:mealexpress/view/widget/auth/custombuttonauth.dart';
import 'package:mealexpress/view/widget/auth/customtextbodyauth.dart';
import 'package:mealexpress/view/widget/auth/customtextformauth.dart';
import 'package:mealexpress/view/widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('ResetPassword',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) =>
      HandlingDataRequest(statusRequest: controller.statusRequest!, widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "New Password"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
                text:
                "Please Enter New Password"),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              mycontroller: controller.password,
              valid: (val) {
                return validInput(val!, 5, 30, "password");
              },
              isNumber: false,
              obscureText: controller.isshowpassword,
              onTapIcon: (){
                controller.showPassword();
              },
              hinttext: "Enter Your Password",
              iconData: Icons.lock_outline,
              labeltext: "Password",
              // mycontroller: ,
            ),   CustomTextFormAuth(
              mycontroller: controller.repassword,
              valid: (val) {
                return validInput(val!, 5, 30, "password");
              },
              isNumber: false,
              obscureText: controller.isshowpassword,
              onTapIcon: (){
                controller.showPassword();
              },
              hinttext: "Re Enter Your Password",
              iconData: Icons.lock_outline,
              labeltext: "Password",
              // mycontroller: ,
            ),
            CustomButtonAuth(text: "Save", onPressed: () {
              controller.goToSuccessResetPassword();
            }),
            const SizedBox(height: 40),
          ]),
        ),
      )
      ))
    );
  }
}