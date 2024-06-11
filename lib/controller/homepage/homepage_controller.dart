/* 
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/function/handlingdata_controller.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/datasourse/remote/home_data.dart';
import 'package:delivery_app/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  initialData();
  getData();
  goToPageItems(List categories, int selectedCat, String categoryId);
}

class HomePageControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  String? lang;
  String? user;
  String? id;
  String? categoryId;

  String titleHomeCard = "";
  String bodyHomeCard = "";
  String deliverTime = "";

  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  List<ItemsModel> items = [];
  List settingsData = [];
  HomePageData homePageData = HomePageData(Get.find());

  //final con = Get.lazyPut(() => ItemsDetailsControllerImp());

  initialData() {
    lang = myServices.sharedPref.getString("lang");
    user = myServices.sharedPref.getString("username");
    id = myServices.sharedPref.getString("id");
    categoryId = myServices.sharedPref.getString("catid");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        List listItems = response['items']['data'];
        items.addAll(listItems.map((e) => ItemsModel.fromJson(e)));
        settingsData.addAll(response['settings']['data']);
        titleHomeCard = settingsData[0]['settings_titlehome'];
        bodyHomeCard = settingsData[0]['settings_bodyhome'];
        deliverTime = settingsData[0]['settings_deliverytime'].toString();
        myServices.sharedPref.setString("deliverytime", deliverTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  goToPageItems(categories, selectedCat, categoryId) {
    Get.toNamed(
      AppRotes.itemsHomePage,
      arguments: {
        "categories": categories,
        "selectedcat": selectedCat,
        "catid": categoryId,
      },
    );
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRotes.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }
}

class SearchMixController extends GetxController {
  late StatusRequest statusRequest;
  HomePageData homePageData = HomePageData(Get.find());
  late TextEditingController search;
  bool isSearch = false;

  List<ItemsModel> listData = [];

  getSearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageData.searchData(search.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }

  checkSearchItems(String val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchIcons() {
    isSearch = true;
    getSearchData();
    update();
  }

  showSnack() {
    if (search.text == "") {
      Get.snackbar("title", "message", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
 */