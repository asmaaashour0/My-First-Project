import 'package:flutter/material.dart';
import 'package:project3/view/screens/home_Screens/home_screen.dart';
import 'package:project3/view/screens/trips_screen/trips_screen.dart';

import 'core/constant/app_routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (ctx) => HomeScreen(),
  AppRoute.home: (context) => HomeScreen(),
  AppRoute.trips: (context) => TripsScreen(),
};
