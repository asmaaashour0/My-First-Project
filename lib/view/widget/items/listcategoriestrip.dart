import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controller/trips_controller.dart';
import 'package:project3/core/constant/appcolor.dart';

import '../../../data/model/categoriesmodel.dart';

class ListCategorisTrips extends GetView<TripsControllerImp> {
  const ListCategorisTrips({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (contex, index) {
          return Categorries(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categorries extends GetView<TripsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categorries({
    super.key,
    required this.categoriesModel,
    required this.i,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.gotoTrips(controller.categories, i!);
        controller.changCat(i!, categoriesModel.id!);
      },
      child: Column(
        children: [
          GetBuilder<TripsControllerImp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectCat == i
                  ? const BoxDecoration(
                      border: Border(
                      bottom:
                          BorderSide(width: 3, color: AppColor.prrimaryColor),
                    ))
                  : null,
              child: Text(
                "${categoriesModel.name}",
                style: const TextStyle(fontSize: 20, color: AppColor.gray2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
