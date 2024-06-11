import 'dart:io';
import 'package:delivery_app/controller/homepage/homepagescreen_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/view/widget/homepage/custombuttonappbarhomeoage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageScreenControllerImp());
    return GetBuilder<HomePageScreenControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
              "${controller.buttonAppBar[controller.currentPage]["text"]}"),
        ),
        //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomButtonAppBarHomePage(),
        // ignore: deprecated_member_use
        body: WillPopScope(
          child: controller.listPage.elementAt(controller.currentPage),
          onWillPop: () {
            Get.defaultDialog(
                title: "154".tr,
                titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.secondColor),
                middleText: "155".tr,
                middleTextStyle:
                    const TextStyle(fontSize: 17, color: AppColor.secondColor),
                backgroundColor: AppColor.backGround,
                buttonColor: AppColor.thirdColor,
                cancelTextColor: AppColor.secondColor,
                confirmTextColor: AppColor.secondColor,
                onConfirm: () {
                  exit(0);
                },
                onCancel: () {
                  Get.back();
                });
            return Future.value(false);
          },
        ),
      ),
    );
  }
}
