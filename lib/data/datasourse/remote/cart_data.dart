


import 'package:mealexpress/core/class/crud.dart';
import 'package:mealexpress/linkapi.dart';

class CartData {

  Crud crud ;

  CartData(this.crud) ;

  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "usersid": usersid,
      "itemsid" : itemsid}
    );
    return response.fold((l) => l, (r) => r) ;
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartDelete, {
      "usersid": usersid,
      "itemsid" : itemsid}
    );
    return response.fold((l) => l, (r) => r) ;
  }

  gatCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartgetcountitems, {
      "usersid": usersid,
      "itemsid" : itemsid}
    );
    return response.fold((l) => l, (r) => r) ;
  }

  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid": usersid,
      }
    );
    return response.fold((l) => l, (r) => r) ;
  }

  checkCoupon(String couponname) async {
    var response =
    await crud.postData(AppLink.checkCoupon, {
      "couponname": couponname
    }
    );
    return response.fold((l) => l, (r) => r);
  }




}