import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controller/testcontroller.dart';
import 'package:project3/core/class/handlingdataview.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    TestController controller = Get.put(TestController());
    return Scaffold(
      body: Obx(
        () => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text(
                    "${controller.data}",
                    style: TextStyle(fontSize: 50),
                  );
                })),
      ),
    );
  }
}
