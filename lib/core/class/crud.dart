

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mealexpress/core/class/statusrequest.dart';
import 'package:mealexpress/core/functions/checkinternet.dart';


//la classe Crud qui semble être utilisée pour effectuer des opérations CRUD (Create, Read, Update, Delete)
// via des appels HTTP, en particulier pour l'envoi de données via une requête POST
class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
       // Cette ligne envoie une requête POST à l'URL spécifiée (linkurl) en utilisant la bibliothèque HTTP.
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}