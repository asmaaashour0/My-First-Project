import 'package:get/get.dart';
import 'package:project3/data/model/copons_model.dart';

import '../core/class/statusrequest.dart';
import '../core/function/handlingdata.dart';
import '../data/datasource/remote/test.dart';

abstract class TripsDetailsController extends GetxController {}

class TripsDetailsControllerImp extends TripsDetailsController {
  late TripsCoponsModel tripsModel;

  intialData() {
    tripsModel = Get.arguments['tripsmodel'];
  }

  @override
  void onInit() {
    intialData();
    getData();
    super.onInit();
  }

  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    //print("$response .............................controller");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      print(" I now in controller");
      if (response[0]['stutuse'] == 'success') {
        //print("$response ...................statuse");
        data.addAll((response[0]['categories']));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
