import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controller/favorite_controller.dart';

import '../../../controller/trips_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../data/model/copons_model.dart';
import '../../widget/customappbar.dart';
import '../../widget/items/listcategoriestrip.dart';
import '../../widget/items/trip_card.dart';
import '../home_Screens/home.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TripsControllerImp controller = Get.put(TripsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              onChanged: (val) {
                controller.checkSearch(val);
              },
              mycontroller: controller.search!,
              hintTitle: "find Trips",
              onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearch();
              },
            ),
            SizedBox(height: 20),
            ListCategorisTrips(),
            GetBuilder<TripsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch // List Name Category
                    ? ListView.builder(
                        itemCount: controller.data.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          controllerFav
                                  .isFavorite[controller.data[index]['id']] =
                              controller.data[index]['favorite'];
                          return TripCard(
                            //active: false,
                            tripsModel: TripsCoponsModel.fromJson(
                                controller.data[index]),
                          );
                        })
                    : ListTripsSearch(listdatamodel: controller.listdata),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
