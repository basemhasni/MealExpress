
import 'package:flutter/material.dart';
import 'package:mealexpress/core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(title ,
                style:const TextStyle(color: Colors.white , fontSize: 20)),
            subtitle: Text(body  ,
                style: const TextStyle(color: Colors.white , fontSize: 30)),
          ),
        ) ,
        Positioned(
          top: -20,
          right: -20,
          child: Container(height: 160,width: 160,decoration: BoxDecoration(
              color: AppColor.secondColor ,
              borderRadius: BorderRadius.circular(160)
          ),),
        )
      ]),
    );
  }
}
