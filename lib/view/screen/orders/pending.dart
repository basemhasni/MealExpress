

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/orders/pending_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/view/widget/orders/orderslistcard.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
        ),
        body: Container(

          padding:  EdgeInsets.all(10),
          child: GetBuilder<OrdersPendingController>(
            builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder:(context, index) => CardOrdersList(listdata: controller.data[index]),
            ),)
          ),

        ));
  }
}
