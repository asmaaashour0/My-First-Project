import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controller/trip_deaitels_controller.dart';
import 'package:project3/core/constant/appcolor.dart';
import 'package:project3/view/widget/details/priceandcount.dart';

import '../../widget/details/toppagetripdetails.dart';

class TripsDetailsScreen extends StatelessWidget {
  const TripsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TripsDetailsControllerImp controller = Get.put(TripsDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondColor,
          onPressed: () {},
          child: const Text(
            "Add to your Travel ^_^",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView(
        children: [
          const TopPagetripDetails(),
          const SizedBox(
            height: 100,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.tripsModel.name}",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColor.gray2),
                ),
                const SizedBox(
                  height: 10,
                ),
                /////Number of Booking
                PriceAndCount(
                    onAdd: () {}, onRemov: () {}, count: "", price: "price"),

                ////Descreption
                Text(
                  "${controller.tripsModel.name}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
