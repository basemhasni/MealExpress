

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/orders/archive_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/data/model/ordersmodel.dart';
import 'package:mealexpress/view/widget/orders/dialograting.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),

                  Text(listdata.ordersDatetime!,style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold)),

                ],
              ),
              const Divider(),
              Text(
                  "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \D\T"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \D\T "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersTotalprice} \D\T ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Details"),
                  ),
                  SizedBox(width: 10),
                 if(listdata.ordersRating == "0") MaterialButton(
                    onPressed: () {
                      showDialogRating(context,listdata.ordersId!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: const Text("Rating"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}