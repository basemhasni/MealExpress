


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/favorite_controller.dart';
import 'package:mealexpress/controller/offers_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/view/screen/home.dart';

import 'widget/customappbar.dart';
import 'widget/offers/customitemsoffers.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OffersController offersController = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return GetBuilder<OffersController>(builder: (controller) => Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          CustomAppBar(titleappbar: "19".tr,
            onPressedSearch: () {
              controller.onSearchItems();
            },
            onPressedIconFavorite: () {
              Get.toNamed(AppRoute.myfavorite) ;
            },
            mycontroller: controller.search!,
            onChanged: (val) {
              controller.checkSearch(val);
            },
          ),
          SizedBox(height: 20),
          !controller.isSearch ?
          HandlingDataView(statusRequest: controller.statusRequest,
              widget: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.data.length,
                itemBuilder:(context, index) =>
                    CustomListItemsOffer(itemsModel: controller.data[index]), )

          )  : ListItemsSearch(listdatamodel: controller.listdata)
        ],
      ),
    )

    );
  }
}
