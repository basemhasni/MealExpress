

import 'package:flutter/material.dart';
import 'package:mealexpress/core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String message ;
  const TopCardCart({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColor.primaryColor)),
    ) ;
  }
}