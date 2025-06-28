

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/favorite_controller.dart';
import 'package:mealexpress/controller/offers_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/constant/imageasset.dart';
import 'package:mealexpress/core/functions/translatedatabase.dart';
import 'package:mealexpress/data/model/itemsmodel.dart';
import 'package:mealexpress/linkapi.dart';

class CustomListItemsOffer extends GetView<OffersController> {
  final ItemsModel itemsModel;

  const CustomListItemsOffer( {Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {

        },
        child: Card(
          child: Stack(
              children: [ Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl: AppLink.imageItems + "/" + itemsModel.itemsImage!,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 10) ,
                      Text(TranslateDatabase(itemsModel.itemsNameFr, itemsModel.itemsName),
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${itemsModel.itemsPriceDiscount} \D\T ",
                              style: const TextStyle(
                                  color: AppColor.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "sans")),
                          GetBuilder<FavoriteController>(builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] == "1"){
                                  controller.setFavorite(itemsModel.itemsId , "0");
                                  controller.removeFavorite(itemsModel.itemsId!);
                                }else{
                                  controller.setFavorite(itemsModel.itemsId , "1");
                                  controller.addFavorite(itemsModel.itemsId!);

                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == "1" ? Icons.favorite  : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                              )),)
                        ],
                      )
                    ]),
              ),
                if(itemsModel.itemsDiscount != "0")
                  Positioned(top: 4,
                      left: 4,
                      child: Image.asset(AppImageAsset.sale, width: 40,))
              ]),
        ));
  }
}
