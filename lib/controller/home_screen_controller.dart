import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project3/view/screens/home_Screens/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;

  List<Widget> ListPage = [
    Home(),
    const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Text("setting"),
      )
    ]),
    const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: Text("favorit"),
      )
    ]),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("boking"),
        )
      ],
    )
  ];
  List titleButtomAppBAr = ["home", "settings", "profile", "favorit"];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
