

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/core/services/services.dart';
import 'package:mealexpress/data/datasourse/remote/favorite_data.dart';

class FavoriteController extends GetxController{

  FavoriteData favoriteData = FavoriteData(Get.find());

  Map isFavorite  = {} ;

// key => id items
// value  => 0 OR 1

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List data = [];

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Alert",
            messageText: const Text("The product has been added to the favorite"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  removeFavorite(String itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Alert",
            messageText: const Text("The product has been deleted from the favorite"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }



}
