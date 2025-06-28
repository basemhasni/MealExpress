


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/address/add_controller.dart';
import 'package:mealexpress/core/class/handlingdataview.dart';
import 'package:mealexpress/core/shared/custombutton.dart';
import 'package:mealexpress/view/widget/auth/customtextformauth.dart';


class AddressAdd extends StatelessWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressController controller =
    Get.put(AddAddressController());
    return Scaffold(
      appBar:  AppBar(
        title: const Text("ADD Address"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
            child: GetBuilder<AddAddressController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(children: [
                    CustomTextFormAuth(
                        hinttext: "city",
                        labeltext: "city",
                        iconData: Icons.location_city,
                        mycontroller: controller.city,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "street",
                        labeltext: "street",
                        iconData: Icons.streetview,
                        mycontroller: controller.street,
                        valid: (val) {},
                        isNumber: false),
                    CustomTextFormAuth(
                        hinttext: "name",
                        labeltext: "name",
                        iconData: Icons.near_me,
                        mycontroller: controller.name,
                        valid: (val) {},
                        isNumber: false),
                    CustomButton(
                      text: "Add",
                      onPressed: () {
                        controller.addAddress() ;
                      },
                    )
                  ])),
            )
      ),


    );


  }
}
