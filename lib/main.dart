import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/routes.dart';

import 'binding/initialbinding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/sevices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      locale: controller.language,
      translations: Translation(),
      //home: HomeScreen(),
      initialRoute: '/',
      routes: routes,
      //sqflite: 2.2.6 || 2.2.8 || 2.2.8+1
    );
  }
}
