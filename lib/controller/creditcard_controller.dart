import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  SharedPreferences? sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveCreditCardDetails(Map<String, String> details) async {
    if (sharedPreferences != null) {
      await sharedPreferences!.setString('cardNumber', details['cardNumber']!);
      await sharedPreferences!.setString('cardHolder', details['cardHolder']!);
      await sharedPreferences!.setString('expirationDate', details['expirationDate']!);
      await sharedPreferences!.setString('cvv', details['cvv']!);
    }
  }
}

class CreditCardScreen extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expirationDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

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

    cardNumberController.clear();
    cardHolderController.clear();
    expirationDateController.clear();
    cvvController.clear();

    Get.snackbar(
      'Success',
      'Credit card details saved!',
      duration: Duration(seconds: 3),
    );
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
                labelText: 'Card Holder',
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
              onPressed: _saveCreditCard,
              child: Text('Save Credit Card'),
            ),
          ],
        ),
      ),
    );
  }
}
