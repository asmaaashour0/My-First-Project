import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../data/model/copons_model.dart';
import '../../widget/customappbar.dart';
import '../../widget/home/customcardhome.dart';
import '../../widget/home/customtitlehome.dart';
import '../../widget/home/listcategorieshom.dart';
import '../../widget/home/listitemshome.dart';

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCardHome(
                            title: "A Summer Suroprise", body: 'CachBak 20%'),
                        CustomTitleHome(title: '1'.tr),
                        const ListCategorisHome(),
                        CustomTitleHome(title: '2'.tr),
                        const ListItemsHome(),
                      ],
                    )
                  : ListTripsSearch(listdatamodel: controller.listdata),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTripsSearch extends GetView<HomeControllerImp> {
  final List<TripsCoponsModel> listdatamodel;
  ListTripsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.gotoPageTripeDeaiteles(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child:
                            Image.asset("assets/photo_2024-05-28_06-23-32.jpg")
                        //     CachedNetworkImage(
                        //   imageUrl: "${listdatamodel[index].image}",
                        // )
                        ),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text("${listdatamodel[index].name}"),
                          subtitle: Text(
                              "${listdatamodel[index].name}"), //category name
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
