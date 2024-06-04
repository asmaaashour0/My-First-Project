import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_screen_controller.dart';
import 'custombuttonappbar.dart';

class CustomButtomAppBarHome extends StatelessWidget {
  const CustomButtomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.ListPage.length + 1,
              ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? Spacer()
                    : CustomButtonAppBar(
                        textbutton: controller.titleButtomAppBAr[i],
                        icondata: Icons.home,
                        onPressed: () {
                          controller.changePage(i);
                        },
                        active: controller.currentPage == i ? true : false,
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
