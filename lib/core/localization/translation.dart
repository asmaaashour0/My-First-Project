import 'package:get/get.dart';

class Translation implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "1": "التصنيفات",
          "2": "عروض الرحلات",
        },
        "en": {
          "1": "categories",
          "2": "Trips Offer you",
        }
      };
}
