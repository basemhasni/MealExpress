

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealexpress/controller/creditcard_controller.dart';
import 'package:mealexpress/core/constant/color.dart';
import 'package:mealexpress/core/constant/imageasset.dart';
import 'package:mealexpress/core/constant/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  _CreditCardScreenState createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expirationDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences != null) {
      setState(() {
        cardNumberController.text = sharedPreferences!.getString('cardNumber') ?? '';
        cardHolderController.text = sharedPreferences!.getString('cardHolder') ?? '';
        expirationDateController.text = sharedPreferences!.getString('expirationDate') ?? '';
        cvvController.text = sharedPreferences!.getString('cvv') ?? '';
      });
    }
  }

  void _saveCreditCard() {
    final String cardNumber = cardNumberController.text;
    final String cardHolder = cardHolderController.text;
    final String expirationDate = expirationDateController.text;
    final String cvv = cvvController.text;

    final Map<String, String> creditCardDetails = {
      'cardNumber': cardNumber,
      'cardHolder': cardHolder,
      'expirationDate': expirationDate,
      'cvv': cvv,
    };

    final SharedPreferencesController sharedPrefsController = Get.find();
    sharedPrefsController.saveCreditCardDetails(creditCardDetails);

    Get.snackbar(
      'Success',
      'Credit card details saved!',
      duration: Duration(seconds: 3),
    );
    Get.toNamed(AppRoute.homepage);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SharedPreferencesController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit Card Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: cardNumberController,
              decoration: InputDecoration(
                labelText: 'Card Number',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: cardHolderController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: expirationDateController,
                    decoration: InputDecoration(
                      labelText: 'Expiration Date',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: cvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
              ),
              onPressed: _saveCreditCard,
              child: Text('Save Credit Card'),
            ),
            SizedBox(height: 50),
            Image.asset(AppImageAsset.creditcard)
          ],
        ),
      ),
    );
  }
}
