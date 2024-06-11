import 'package:delivery_app/view/screen/orders/accepted.dart';
import 'package:delivery_app/view/screen/orders/archieve_orders.dart';
import 'package:delivery_app/view/screen/orders/pending_orders.dart';
import 'package:delivery_app/view/screen/setting/settingpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageScreenController extends GetxController {
  changePage(int currentPage);
}

class HomePageScreenControllerImp extends HomePageScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    // const HomePage(),
    const PendingOrders(),
    const AcceptedOrders(),
    const ArchivedOrders(),
    const SettingPage(),
  ];

  //List textButtonAppBar = ["48".tr, "49".tr, "50".tr, "51".tr];
  List buttonAppBar = [
    {"title": "192".tr, "icon": Icons.approval_outlined, "text": "111".tr},
    {
      "title": "193".tr,
      "icon": Icons.add_shopping_cart_rounded,
      "text": "111".tr
    },
    {"title": "149".tr, "icon": Icons.archive_outlined, "text": "111".tr},
    {"title": "65".tr, "icon": Icons.settings, "text": "65".tr},
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentPage = index;
    update();
  }
}
