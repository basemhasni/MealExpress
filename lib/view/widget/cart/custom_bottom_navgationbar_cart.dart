

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/cart_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/view/widget/cart/buttoncart.dart';
import 'package:mealexpress/view/widget/cart/custombuttoncoupon.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price ;
  final String discount ;
  final String totalprice ;
  final String shipping ;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart({Key? key, required this.price, required this.discount, required this.totalprice, required this.controllercoupon, this.onApplyCoupon, required this.shipping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<CartController>(
                builder: (controller) =>
                controller.couponname == null ?
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                hintText: "Coupon Code",
                                border: OutlineInputBorder()),
                          )),
                      SizedBox(width: 5),
                      Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: "23".tr,
                            onPressed: onApplyCoupon,
                          ))
                    ]))
                    : Container(child: Text("Coupon Code ${controller.couponname!}" , style: TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),))
            ),
           Container(
             margin: EdgeInsets.all(10),
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               border:  Border.all(color: AppColor.primaryColor , width: 1),
               borderRadius: BorderRadius.circular(10)
             ),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("24".tr, style: TextStyle(fontSize: 16))),
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("$price \D\T", style: TextStyle(fontSize: 16)))
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("25".tr, style: TextStyle(fontSize: 16))),
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("$discount", style: TextStyle(fontSize: 16)))
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("26".tr, style: TextStyle(fontSize: 16))),
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("$shipping", style: TextStyle(fontSize: 16)))
                   ],
                 ),
                 Divider(),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("27".tr,
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 color: AppColor.primaryColor))),
                     Container(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Text("$totalprice \D\T",
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.bold,
                                 color: AppColor.primaryColor)))
                   ],
                 ),
               ],

             ),
           ),
            SizedBox(height: 10),
            CustomButtonCart(
              textbutton: "28".tr,
              onPressed: () {
                controller.goToPageCheckout();
              },
            )
          ],
        ));
  }
}