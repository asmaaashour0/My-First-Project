import 'dart:ui';

import 'package:get/get.dart';

import '../services/sevices.dart';


class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ChangeLocal(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharPrefLang == "ar") {
      language = const Locale("ar");
      //CategoryTripsScreen.screenRoute     ........مابدي ارجع لهي الصفحة كل مرة بعمل ريستارت
      //Get.to(AppRoute.language);
    } else if (sharPrefLang == "en") {
      language = const Locale("en");
      //Get.to(AppRoute.language);
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
