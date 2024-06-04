import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/core/constant/appcolor.dart';

import '../../../controller/home_controller.dart';
import '../../../data/model/categoriesmodel.dart';

class ListCategorisHome extends GetView<HomeControllerImp> {
  const ListCategorisHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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

class Categorries extends GetView<HomeControllerImp> {
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
        controller.gotoTrips(controller.categories, i!, categoriesModel.id!);
      },
      //print("${categoriesModel.categoriesId!}");
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: AppColor.fourColor,
                borderRadius: BorderRadius.circular(20),
              ),
              //padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 85,
              width: 85,
              child: Image.asset(
                "assets/photo_2024-05-28_06-23-32.jpg",
                // width: 85,
                // height: 85,
              )),
          //////////////////////////////////////////////Notes
          // SvgPicture.network(
          //   '${categoriesModel.image}', //color: Colors.blue,
          // ),
          Text(
            "${categoriesModel.name}",
            style: const TextStyle(fontSize: 13, color: Colors.black),
          ),
          // Container(
          //     padding: EdgeInsets.all(50),
          //     child: Text("${categoriesModel.id!}")),
        ],
      ),
    );
  }
}
