

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/favorite_controller.dart';
import 'package:mealexpress/controller/items_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/data/model/itemsmodel.dart';
import 'package:mealexpress/view/screen/home.dart';
import 'package:mealexpress/view/widget/customappbar.dart';
import 'package:mealexpress/view/widget/items/customlistitems.dart';
import 'package:mealexpress/view/widget/items/listcategoriesitem.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child:  ListView(children: [
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
              const ListCategoriesItems(),
        GetBuilder<ItemsControllerImp>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest,
            widget: !controller.isSearch ?
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:controller.data.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, index) {
                    controllerFav.isFavorite[controller.data[index]['items_id']] = controller.data[index]['favorite'];
                    return CustomListItems(
                        itemsModel: ItemsModel.fromJson(controller.data[index]));
                  })

                :  ListItemsSearch(listdatamodel: controller.listdata)

        )
        )
        ]),
        ),
    );
  }
}
