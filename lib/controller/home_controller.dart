import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project3/core/constant/app_routes.dart';
import 'package:project3/data/model/copons_model.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../core/services/sevices.dart';
import '../data/datasource/remote/homedata.dart';
import '../view/screens/deaiteles/trips_deaiteles_screen.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  gotoTrips(List categories, int selectedCat, int categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
////////////////////////////////////////////////////////////////////////
//   final categ = <CategoriesModel>[].obs;
//   final cop = <ItemModel>[].obs;
//   void fetchData() {
//     categ.assignAll([
//       CategoriesModel(
//           categoriesId: 1, name: 'Mountains', image: 'mountains.jpg'),
//       CategoriesModel(categoriesId: 2, name: 'Deserts', image: 'deserts.jpg'),
//       CategoriesModel(categoriesId: 3, name: 'Beaches', image: 'beaches.jpg'),
//     ]);
//   }
////////////////////////////////////////////////////////////////////////

  // String? username;
  // String? id;
  HomeData homedata = HomeData(Get.find());
  List categories = [];
  List items = [];

  //late StatusRequest statusRequest;

  @override
  initialData() {
    //lang = myServices.sharedPreferences.getString("lang");
    // username = myServices.sharedPreferences.getString("username");
    // id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("===================================== Controller $response");
    statusRequest = handlingData(Response);
    print("$statusRequest"); //
    if (StatusRequest.success == statusRequest) {
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      if (response[0]['stutuse'] == 'success') {
        print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

        categories.addAll(response[0]['categories']);
        print("$categories");
        items.addAll(response[1]['coupons']);
        print("$items");
        print(response[0]['stutuse']);
        // print(response[0]['categories']['image']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoTrips(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.trips, arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "catId": categoryid,
    });
  }
}

class SearchMixController extends GetxController {
  HomeData homedata = HomeData(Get.find());
  List<TripsCoponsModel> listdata = [];
  bool isSearch = false;
  late StatusRequest statusRequest;
  TextEditingController? search;

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.SearchData(search!.text);
    print(search!.text);
    print("===================================== Search Controller $response");
    statusRequest = handlingData(Response);
    if (StatusRequest.success == statusRequest) {
      // if (response['stutuse'] == "success") {
      listdata.clear();
      List responsedata = response['Search Results'];
      print(responsedata);
      listdata.addAll(responsedata.map((e) =>
          TripsCoponsModel.fromJson(e))); //////في نقص مشان المديل تبع الرحلة
      //.map((e) = > TripModel.fromjson(e))
      // }
      // else {
      //   statusRequest = StatusRequest.failure;
      // }
    }
    update();
  }

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearch() {
    isSearch = true;
    searchData();
    update();
  }

  gotoPageTripeDeaiteles(tripsModel) {
    Get.to(TripsDetailsScreen(), arguments: {
      "tripsmodel": tripsModel,
    });
  }
}
