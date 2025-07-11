
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/productdetails_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/translatedatabase.dart';
import 'package:mealexpress/view/widget/productdetails/priceandcount.dart';
import 'package:mealexpress/view/widget/productdetails/toppageproductdetails.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                  },
                child:  Text(
                  "21".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest,
            widget: ListView(children: [
          const TopProductPageDetails(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("${TranslateDatabase(controller.itemsModel.itemsNameFr, controller.itemsModel.itemsName)}",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.fourthColor,
                  )),
              const SizedBox(height: 10),
              PriceAndCountItems(
                  onAdd: () {controller.add();},
                  onRemove: () {controller.remove();},
                  price: "${controller.itemsModel.itemsPriceDiscount}", count: "${controller.countitems}"),
              const SizedBox(height: 10),
              Text(
                  "${TranslateDatabase(controller.itemsModel.itemsDescFr, controller.itemsModel.itemsDesc)} ",
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 10),
              // Text("Color",
              //     style: Theme.of(context).textTheme.displayLarge!.copyWith(
              //       color: AppColor.fourthColor,
              //     )),
              // const SizedBox(height: 10),
              // const SubitemsList()

            ]),
          )
        ])),)
    );
  }
}
