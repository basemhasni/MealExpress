

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/checkout_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/constant/imageasset.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/view/widget/checkout/carddeliveerytype.dart';
import 'package:mealexpress/view/widget/checkout/cardpaymentmethod.dart';
import 'package:mealexpress/view/widget/checkout/cardshippingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('29'.tr),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                       Text(
                        "30".tr,
                        style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0"); // 0 => cash
                        },
                        child: CardPaymentMethodCheckout(
                            title: "31".tr,
                            isActive: controller.paymentMethod == "0"
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1"); // 1 => card
                        },
                        child: CardPaymentMethodCheckout(
                            title: "32".tr,
                            isActive: controller.paymentMethod == "1"
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 20),
                       Text(
                        "33".tr,
                        style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("0"); // 0 => delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.delivery,
                                title: "37".tr,
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); // 1 => recive
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: AppImageAsset.drivethru,
                                title: "34".tr,
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0") //delivery
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(controller.dataaddress.isNotEmpty)
                             Text(
                              "35".tr,
                              style: TextStyle(
                                  color: AppColor.secondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            if(controller.dataaddress.isEmpty)
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AppRoute.addressadd);
                                },
                                child: Container(
                                  child: Center(child: Text("36".tr , textAlign: TextAlign.center,
                                  style:  TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold))),
                                ),
                              ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                                  (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      controller.dataaddress[index].addressId!);
                                },
                                child: CardShppingAddressCheckout(
                                    title:
                                    "${controller.dataaddress[index].addressName}",
                                    body:
                                    "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                        controller
                                            .dataaddress[index].addressId
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        ),


                    ],
                  )))),
    );
  }
}
