

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/core/services/services.dart';
import 'package:mealexpress/data/datasourse/remote/home_data.dart';
import 'package:mealexpress/data/model/itemsmodel.dart';

abstract class HomeController extends SearchMixController {
  initialData() ;
  getdata();
  goToItems(List categories , int selectedCat,String categoryid);
}

 class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  String titleHomeCard = "";
  String bodyHomeCard =  "";
  String deliveryTime = "";

  HomeData homeData = HomeData(Get.find());

  List data = [];
  List categories = [];
  List items = [];
  List settingsdata = [];





  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username") ;
    id = myServices.sharedPreferences.getString("id") ;
  }



  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async{
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingsdata.addAll(response['settings']['data']);

        titleHomeCard = settingsdata[0]['settings_titlehome'];
        bodyHomeCard = settingsdata[0]['settings_bodyhome'];
        deliveryTime = settingsdata[0]['settings_deliverytime'];
        myServices.sharedPreferences.setString("deliverytime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure ;
      }
    }
    update();
  }

  @override
  goToItems(categories,selectedCat, categoryid) {

    Get.toNamed(AppRoute.items,
        arguments: {"categories" : categories ,
          "selectedcat": selectedCat ,
          "catid" : categoryid} );
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});

  }

  
  }

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
