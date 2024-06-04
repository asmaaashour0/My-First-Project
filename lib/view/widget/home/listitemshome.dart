import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/view/screens/trips_screen/trips_screen.dart';

import '../../../controller/home_controller.dart';
import '../../../data/model/copons_model.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
              itemModel: TripsCoponsModel.fromJson(controller.items[i]),
            );
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final TripsCoponsModel itemModel;
  const ItemsHome({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(
        TripsScreen(),
      ),
      child: Stack(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset("assets/photo_2024-05-28_06-23-32.jpg")
              ////////////////////////////////////////////////Notes
              // Image.network(
              //   '${itemModel.image}',
              //   height: 100,
              //   width: 150,
              //   fit: BoxFit.fill,
              // ),
              ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 160,
            width: 230,
          ),
          Positioned(
            child: Text(
              "${itemModel.name}",
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
