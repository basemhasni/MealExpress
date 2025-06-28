

import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/data/datasourse/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {

  String? email;
  StatusRequest? statusRequest = StatusRequest.none ;
  
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());


  @override
  checkCode() {

  }

  @override
  goToResetPassword(verifycode) async{
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postdata(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword , arguments: {
          "email" : email
        });
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

}