



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/home_controller.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/data/datasourse/remote/offers_data.dart';
import 'package:mealexpress/data/model/itemsmodel.dart';

class OffersController extends SearchMixController{

  OfferData offerData = OfferData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await offerData.getData();
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == "success"){
        List listdata2 = response['data'];
        data.addAll(listdata2.map((e) => ItemsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}