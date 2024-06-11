import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/function/handlingdata_controller.dart';
import 'package:delivery_app/core/localization/changetranslation.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/datasourse/remote/setting/profiledelivery.dart';
import 'package:delivery_app/data/model/deliverymodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  SettingData settingData = SettingData(Get.find());
  List<DeliveryModel> deliveryList = [];
  final switcherController = ValueNotifier<bool>(false);
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    viewAdminData();
    switcherController.addListener(() {});
  }

  @override
  dispose() {
    super.dispose();
    switcherController.dispose();
  }

  changeLanguage(String codeLanguage) async {
    MyLocalController controller = Get.find();
    isLoading = true;
    controller.changeLang(codeLanguage);
    await Future.delayed(const Duration(seconds: 4));
    isLoading = false;
    Get.offAllNamed(AppRotes.homePage);
    update();
  }

  viewAdminData() async {
    deliveryList.clear();
    statusRequest = StatusRequest.loading;
    update();
    // ignore: unused_local_variable
    Map adminData = {
      "email": myServices.sharedPref.getString("email"),
      "password": myServices.sharedPref.getString("valPassword")
    };
    var response = await settingData.viewDeliveryData(adminData);
    print("response response response ============================ $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        deliveryList.addAll(responseData.map((e) => DeliveryModel.fromJson(e)));
        print(
            "email =========================================== ${deliveryList[0].deliveryEmail}");
        print(
            "name =========================================== ${deliveryList[0].deliveryName}");
        print(
            "image =========================================== ${deliveryList[0].deliveryImage}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  logout() {
    String deliveryId = myServices.sharedPref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("delivery");
    FirebaseMessaging.instance.unsubscribeFromTopic("delivery$deliveryId");
    myServices.sharedPref.clear();
    Get.offAllNamed(AppRotes.login);
  }
}
