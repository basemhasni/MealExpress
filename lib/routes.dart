import 'package:get/get.dart';
import 'package:mealexpress/view/address/add.dart';
import 'package:mealexpress/view/address/view.dart';
import 'package:mealexpress/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:mealexpress/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:mealexpress/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:mealexpress/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:mealexpress/view/screen/auth/login.dart';
import 'package:mealexpress/view/screen/auth/signup.dart';
import 'package:mealexpress/view/screen/auth/success_signup.dart';
import 'package:mealexpress/view/screen/auth/verifycodesignup.dart';
import 'package:mealexpress/view/screen/cart.dart';
import 'package:mealexpress/view/screen/checkout.dart';
import 'package:mealexpress/view/screen/creditcard.dart';
import 'package:mealexpress/view/screen/homescreen.dart';
import 'package:mealexpress/view/screen/items.dart';
import 'package:mealexpress/view/screen/language.dart';
import 'package:mealexpress/view/screen/myfavorite.dart';
import 'package:mealexpress/view/screen/onboarding.dart';
import 'package:mealexpress/view/screen/orders/archive.dart';
import 'package:mealexpress/view/screen/orders/details.dart';
import 'package:mealexpress/view/screen/orders/pending.dart';
import 'package:mealexpress/view/screen/productdetails.dart';

import 'core/constant/routes.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () =>  Language() ,
     //middlewares: [MyMiddleWare()]
  ),
  //GetPage(name: "/", page: () =>  Cart()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),

  //home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  //items
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),

  //favorite
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),

  //Cart
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  //Address
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),

  //Checkout

  GetPage(name: AppRoute.checkout, page: () => const Checkout()),

  //Orders

  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),

   //Payment
    GetPage(name: AppRoute.creditcard, page: () => CreditCardScreen()),













];