

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/home_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/functions/translatedatabase.dart';
import 'package:mealexpress/data/model/categoriesmodel.dart';
import 'package:mealexpress/linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {

  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
        const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoriesmodel: Categoriesmodel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}


class Categories extends GetView<HomeControllerImp> {
  final Categoriesmodel categoriesmodel ;
  final int? i ;
  const Categories({Key? key, required this.categoriesmodel,required this.i }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(controller.categories, i!,categoriesmodel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(
                horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              colorFilter: ColorFilter.mode(AppColor.primaryColor,BlendMode.hardLight),
              "${AppLink.imageCategories}/${categoriesmodel.categoriesImage}",
            ),
          ),
          Text(
            "${TranslateDatabase(categoriesmodel.categoriesNameFr, categoriesmodel.categoriesName)}",
            style: const TextStyle(
                fontSize: 13, color: AppColor.black),
          )
        ],
      ),
    );
  }
}

