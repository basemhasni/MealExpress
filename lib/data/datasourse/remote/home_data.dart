


import 'package:mealexpress/core/class/crud.dart';
import 'package:mealexpress/linkapi.dart';

class HomeData {

  Crud crud ;

  HomeData(this.crud) ;

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r) ;
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {
     "search" : search
    }
    );
    return response.fold((l) => l, (r) => r) ;
  }

}