

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/cart_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/functions/translatedatabase.dart';
import 'package:mealexpress/view/widget/cart/custom_bottom_navgationbar_cart.dart';
import 'package:mealexpress/view/widget/cart/customitemscartlist.dart';
import 'package:mealexpress/view/widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("22".tr),
      ),
        bottomNavigationBar:GetBuilder<CartController>(builder: (controller) => BottomNavgationBarCart(
            price: "${cartController.priceorders}",
            discount: "${controller.discountcoupon}%",
            totalprice: "${controller.getTotalPrice()}",
          controllercoupon: controller.controllercoupon!,
          shipping: "10\D\T",
        onApplyCoupon: () {
          controller.checkcoupon();
        },),
        ),
        body: GetBuilder<CartController>(builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [

                SizedBox(height: 10),
                TopCardCart(message: "You Have ${controller.totalcountitems} Items in Your List"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children:  [
                      ...List.generate(cartController.data.length,
                              (index) => CustomItemsCartList(

                                  name: "${TranslateDatabase(cartController.data[index].itemsNameFr, cartController.data[index].itemsName) }",
                                  price: "${cartController.data[index].itemsprice} \D\T",
                                  count: "${cartController.data[index].countitems}",
                                  imagename: '${cartController.data[index].itemsImage}',
                                onAdd: () async {
                                    await cartController.add(cartController.data[index].itemsId!);
                                    cartController.refreshPage();
                                    },
                                onRemove: () async{
                                  await cartController.delete(cartController.data[index].itemsId!);
                                    cartController.refreshPage();
                                },
                              ),
                      )
                      
                    ],
                  ),
                )
              ],
            )
        ),
        )
    );
  }
}
