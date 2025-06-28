

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/items_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/functions/translatedatabase.dart';
import 'package:mealexpress/data/model/categoriesmodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesmodel:
            Categoriesmodel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;
  const Categories({Key? key, required this.categoriesmodel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i! , categoriesmodel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(

                padding: EdgeInsets.only(right: 10 , left: 10 , bottom: 5),
                decoration: controller.selectedCat == i
                    ? BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 3, color: AppColor.primaryColor)))
                    : null,
                child: Text(
                  "${TranslateDatabase(categoriesmodel.categoriesNameFr, categoriesmodel.categoriesName)}",
                  style:
                  const TextStyle(fontSize: 20, color: AppColor.grey2),
                ),
              ))
        ],
      ),
    );
  }
}