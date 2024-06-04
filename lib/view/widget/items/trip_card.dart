import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controller/favorite_controller.dart';
import 'package:project3/controller/trips_controller.dart';

import '../../../data/model/copons_model.dart';

class TripCard extends GetView<TripsControllerImp> {
  //final bool active;
  const TripCard({
    super.key,
    // required this.active,
    required this.tripsModel,
  });
  final TripsCoponsModel tripsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoPageTripeDeaiteles(tripsModel);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        //margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Hero(
                      tag: "${tripsModel.id}",
                      child: Image.asset("assets/photo_2024-05-28_06-23-32.jpg")
                      //////////////////////////////////////////Notes
                      // Image.network(
                      //   "${tripsModel.image}",
                      //   height: 250,
                      //   width: double.infinity,
                      //   fit: BoxFit.fill,
                      // ),
                      ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  // child تموضع
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  // inside space
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    //مشان الشفافية (تدرج اللون)
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    //الوان التدرج اللي اخترتا
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.8),
                    ],
                    //لحتى يبلش من نص الصورة
                    stops: const [0.6, 1],
                  )),
                  child: Text(
                    "${tripsModel.name}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      overflow: TextOverflow
                          .fade, //مشان اذا كان الكتابة كبيرة بحط نقط
                    ),
                  ),
                ),

                ///////////////////////////////////////////////////////Rating ang Stars
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     const Text(
                //       "Rating 3.5",
                //       textAlign: TextAlign.center,
                //     ),
                //     Container(
                //       height: 22,
                //       alignment: Alignment.bottomCenter,
                //       child: Row(
                //         children: [
                //           ...List.generate(
                //               5,
                //               (index) => const Icon(
                //                     Icons.star,
                //                     size: 15,
                //                   ))
                //         ],
                //       ),
                //     )
                //   ],
                // ),
                ////////////////////////////////////////////////////////////usaing it
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Icon(Icons.today, color: Colors.black),
                  const Text(
                    ' 200\$ ',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<FavoriteController>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        if (controller.isFavorite[tripsModel.id] == '1') {
                          controller.setFavorite(tripsModel.id, '0');
                        } else {
                          controller.setFavorite(tripsModel.id, '1');
                        }
                      },
                      icon: Icon(
                        color: Colors.red,
                        controller.isFavorite[tripsModel.id] == '1'
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      ),
                    ),
                  )
                  ///////////////////When add  trip to favorite
                  /*
                     Icon(
                      tripsModel.favorite == '1' ? Icons.favorite : Icons.favorite_border_outlined,
                      color: Colors.red,
                    ),
                     */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.today, color: Colors.black),
                    SizedBox(
                      width: 6,
                    ),
                    Text(' ايام '),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.black),
                    SizedBox(
                      width: 6,
                    ),
                    Text('seasonText'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.family_restroom, color: Colors.black),
                    SizedBox(
                      width: 6,
                    ),
                    Text('tripTypeText'),
                  ],
                ),
              ],
            ),
          )*/
