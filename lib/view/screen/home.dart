


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/home_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:mealexpress/core/functions/translatedatabase.dart';
import 'package:mealexpress/data/model/itemsmodel.dart';
import 'package:mealexpress/linkapi.dart';
import 'package:mealexpress/view/widget/customappbar.dart';
import 'package:mealexpress/view/widget/home/customcardhome.dart';
import 'package:mealexpress/view/widget/home/customtitlehome.dart';
import 'package:mealexpress/view/widget/home/listcategorieshome.dart';
import 'package:mealexpress/view/widget/home/listitemshome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return
       GetBuilder<HomeControllerImp>(builder: (controller) =>  Container(
              padding:  EdgeInsets.symmetric(horizontal: 15),
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
           HandlingDataView(statusRequest: controller.statusRequest,
             widget:!controller.isSearch
                 ? Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:  [

                 CustomCardHome(title: "${controller.titleHomeCard}",
                     body: "${controller.bodyHomeCard}"),
                 CustomTitleHome(title: "Categories",),
                 ListCategoriesHome(),
                 CustomTitleHome(title: "20".tr,),
                 ListItemsHome()
               ],
             )
                 : ListItemsSearch(listdatamodel: controller.listdata)
           )



                ],
              )
          )
      );

  }
}


class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: CachedNetworkImage(
                                imageUrl:
                                "${AppLink.imageItems}/${listdatamodel[index].itemsImage}")),
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(TranslateDatabase(listdatamodel[index].itemsNameFr!, listdatamodel[index].itemsName!)),
                              subtitle: Text(listdatamodel[index].categoriesName!),
                            )),
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}
