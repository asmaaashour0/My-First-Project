//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project3/controller/trip_deaitels_controller.dart';

import '../../../core/constant/appcolor.dart';

class TopPagetripDetails extends GetView<TripsDetailsControllerImp> {
  const TopPagetripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.prrimaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        Positioned(
          // top: 30,
          // right: Get.width / 8,
          // left: Get.width / 8,
          child: Hero(
              tag: "${controller.tripsModel.id}",
              child: Image.asset("assets/photo_2024-05-28_06-23-32.jpg")),
        ),
      ],
    );
  }
}
////////////////////////////////////Notes
// CachedNetworkImage(
// imageUrl: controller.tripsModel.image!,
// height: 250,
// ),
