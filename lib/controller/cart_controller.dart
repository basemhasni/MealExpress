



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/core/services/services.dart';
import 'package:mealexpress/data/datasourse/remote/cart_data.dart';
import 'package:mealexpress/data/model/cartmodel.dart';
import 'package:mealexpress/data/model/couponmodel.dart';

class CartController extends GetxController{

  TextEditingController? controllercoupon ;
  CouponModel? couponModel;
  int? discountcoupon = 0 ;
  String? couponname ;

  String? couponid;

  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  List<CartModel> data = [];
  double priceorders = 0.0;
  int totalcountitems = 0 ;





  add(String itemsid) async {
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
  }

  delete(String itemsid) async {
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


//pour faire un refresh (ui) dans la cart (boutons add remove et le count)
  resetVarCart(){
    totalcountitems = 0 ;
    priceorders = 0.0;
    data.clear();

  }

  refreshPage(){
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(
        myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if(response['datacart']['status'] == 'success'){

          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          priceorders = double.parse(dataresponsecountprice['totalprice']);
          totalcountitems = int.parse(dataresponsecountprice['totalcount']) ;
        }

      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  getTotalPrice(){
    return (priceorders - priceorders * discountcoupon! / 100 )   ;
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName ;
        couponid = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0 ;
        couponname = null ;
        couponid = null ;
        Get.snackbar("Warning", "Coupon not Valid");
      }
      // End
    }
    update();
  }


  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("Attention", "The Cart is Empty");
    Get.toNamed(AppRoute.checkout, arguments: {
      //if couponid = null il va prend le 0
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString() ,
      "discountcoupon" : discountcoupon.toString()

    });
  }




  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }



}

