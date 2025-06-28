

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/forgetpassword/forgetpasswod_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/view/widget/auth/custombuttonauth.dart';
import 'package:mealexpress/view/widget/auth/customtextbodyauth.dart';
import 'package:mealexpress/view/widget/auth/customtextformauth.dart';
import 'package:mealexpress/view/widget/auth/customtexttitleauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Forget Password',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey)),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) =>
      HandlingDataRequest(statusRequest: controller.statusRequest!, widget: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            const CustomTextTitleAuth(text: "Check Email"),
            const SizedBox(height: 10),
            const CustomTextBodyAuth(
                text:
                "please Enter Your Email Address To Receive A verification code"),
            const SizedBox(height: 15),
            CustomTextFormAuth(
              mycontroller: controller.email,
              valid: (val) {
              },
              isNumber: false,
              hinttext: "Enter Your Email",
              iconData: Icons.email_outlined,
              labeltext: "Email",
              // mycontroller: ,
            ),
            CustomButtonAuth(text: "Check", onPressed: () {
              controller.checkemail();
            }),
            const SizedBox(height: 40),
          ]),
        ),
      ))
      )
    );
  }
}