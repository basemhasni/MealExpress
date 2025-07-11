

import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/data/datasourse/remote/auth/verifycodesignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  VerfiyCodeSignUpData verfiyCodeSignUpData = VerfiyCodeSignUpData(Get.find());

  String? email;
  StatusRequest? statusRequest = StatusRequest.none ;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(email!, verfiyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "ُWarning",
            middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend(){
    verfiyCodeSignUpData.resendData(email!);

  }


}