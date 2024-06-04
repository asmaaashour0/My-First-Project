import 'package:get/get.dart';
import 'package:project3/core/services/sevices.dart';

TranslateDatabase(columnar, columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
