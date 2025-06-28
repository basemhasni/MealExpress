

import 'package:get/get.dart';
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/handlingdatacontroller.dart';
import 'package:mealexpress/core/services/services.dart';
import 'package:mealexpress/data/datasourse/remote/address_data.dart';
import 'package:mealexpress/data/datasourse/remote/checkout_data.dart';
import 'package:mealexpress/data/model/addressmodel.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String? addressid = "0";

  late String couponid;
  late String coupondiscount;
  late String priceorders;


  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    if (paymentMethod == "1"){Get.toNamed(AppRoute.creditcard);}
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        //pour ajouter la première address automatiquement si le user ne choisir pas une addresse
        addressid = dataaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }


  checkout() async {

    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }

    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }
    if(dataaddress.isEmpty){
      return Get.snackbar("Error", "Please select Shipping Address");
    }

    statusRequest = StatusRequest.loading;

    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders,
      "couponid": couponid,
      "coupondiscount" : coupondiscount.toString() ,
      "paymentmethod": paymentMethod.toString(),
    };

    var response = await checkoutData.checkout(data);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
         Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
       Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    getShippingAddress();
    super.onInit();
  }
}