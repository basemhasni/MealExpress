

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/core/services/services.dart';
import 'package:mealexpress/data/datasourse/remote/cart_data.dart';
import 'package:mealexpress/data/model/itemsmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());

  int countitems = 0 ;

  //CartController cartController = Get.put(CartController());
  intialData() async{
    statusRequest = StatusRequest.loading ;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success ;
    update();

  }

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Alert",
            messageText: const Text("The product has been added to the Cart"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Alert",
            messageText: const Text("The product has been deleted from the Cart"));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getCountItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.gatCountCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        int  countitems = 0;
        countitems = int.parse(response['data']);
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  //pour que le count change directement dans le frontend sans faire back
  // l'interieur add() c'est pour le backend
  add(){
    addItems(itemsModel.itemsId!);
    countitems++;
    update();
  }

  remove(){

    deleteItems(itemsModel.itemsId!);
    if(countitems > 0){
      countitems-- ;
      update();
    }

  }
  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}