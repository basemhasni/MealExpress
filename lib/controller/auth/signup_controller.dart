
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/data/datasourse/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {

  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  StatusRequest? statusRequest = StatusRequest.none ;

  SignupData signupData = SignupData(Get.find());

  List data = [];

//utilisé pour gérer l'inscription d'un utilisateur
  @override
  signUp() async {

    var formdata = formstate.currentState;
    if(formdata!.validate()){

      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(username.text, password.text, email.text, phone.text);
      print("=============================== Controller $response ") ;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if(response['status'] == "success"){
          //data.addAll(response['data']);
          Get.offNamed(AppRoute.verifyCodeSignUp,arguments: {
            "email" : email.text
          });
        }else{
          Get.defaultDialog(title: "Warning" , middleText: "Phone Number Or Email Already Exist");
          statusRequest = StatusRequest.failure;
        }
      }

    }else{
      print("Not Valid");
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController() ;
    phone = TextEditingController() ;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}