

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/home_controller.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/core/services/services.dart';
import 'package:mealexpress/data/datasourse/remote/items_data.dart';
import 'package:mealexpress/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val , String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  List categories = [];
  int? selectedCat;
  String? catid ;

  ItemsData itemsData = ItemsData(Get.find());

  String deliverytime = "" ;


  List data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  getItems( categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(categoryid,myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ") ;
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if(response['status'] == "success"){
        data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  intialData() {
    deliverytime = myServices.sharedPreferences.getString("deliverytime")! ;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];
    getItems(catid!);
  }

  //c'est pour la navigation dans items screen entre les catégories
  @override
  changeCat(val,catval) {
    selectedCat = val;
    catid = catval ;
    getItems(catid!);
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  }


}