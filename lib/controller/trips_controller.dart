import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project3/core/services/sevices.dart';
import 'package:project3/data/model/copons_model.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../data/datasource/remote/trips_data.dart';
import '../view/screens/deaiteles/trips_deaiteles_screen.dart';
import 'home_controller.dart';

abstract class TripsController extends GetxController {
  intialData();
  changCat(int val, String catVal);
  getItems(int id);
  gotoPageTripeDeaiteles(TripsCoponsModel tripsModel);
}

class TripsControllerImp extends SearchMixController {
  List categories = [];
  int? selectCat;
  int? catId;
  List data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    // getItems();
    super.onInit();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    selectCat = Get.arguments['selectedCat'];
    catId = Get.arguments['catId'];
    getItems(catId!);
  }

  @override
  changCat(val, catVal) {
    selectCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  tripsData itemsData = tripsData(Get.find());
  MyServices myServices = Get.find();
  @override
  getItems(id) async {
    print("cccccccccccccccccccccccccccccccccccccccccccccccccategoryid");
    print(id);
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        id,
        myServices.sharedPreferences.getString("id")!
            as int); //(userid) because spicule in person
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // this not List like previse order but I should attention on [status] or [statuse] !
      if (response['stutuse'] == "success") {
        print(response['stutuse']);
        //Name Map Response '[data'] or ['trips'] like back must I work
        data.addAll(response['Trips']);
        print(data);
        print("controller=================================================<>");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoPageTripeDeaiteles(tripsModel) {
    Get.to(TripsDetailsScreen(), arguments: {
      "tripsmodel": tripsModel,
    });
  }
}
