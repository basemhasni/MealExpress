

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/orders/archive_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/constant/imageasset.dart';
import 'package:rating_dialog/rating_dialog.dart';


void showDialogRating(BuildContext context , String ordersid){
  showDialog(
   context: context,
    barrierDismissible: true, // set to false if you want to force a rating
     builder: (context) =>
         RatingDialog(
       initialRating: 1.0,
       title: Text(
         'Rating Dialog',
         textAlign: TextAlign.center,
         style: const TextStyle(
           fontSize: 25,
           fontWeight: FontWeight.bold,
         ),
       ),
       message: Text(
         'Tap a star to set your rating. Add more description here if you want.',
         textAlign: TextAlign.center,
         style: const TextStyle(fontSize: 15),
       ),
       image: Image.asset(AppImageAsset.logo,width: 200,height: 200),
       submitButtonText: 'Submit',
       submitButtonTextStyle: TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
       commentHint: 'Set your comment ',
       onCancelled: () => print('cancelled'),
       onSubmitted: (response) {
         OrdersArchiveController controller = Get.find();
        // print('rating: ${response.rating}, comment: ${response.comment}');
         controller.submitRating(response.rating , response.comment, ordersid);

       },
     )
);
}