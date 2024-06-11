// ignore_for_file: unused_local_variable

import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/function/handlingdata_controller.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/datasourse/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUpPage();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  List data = [];
  late TextEditingController email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    super.onInit();

   /*  FirebaseMessaging.instance.getToken().then((value) {
      print("=======================================");
      print(value);
      String? token = value;
    }); */

    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRotes.forgetPassword);
  }

  @override
  goToSignUpPage() {
    Get.offNamed(AppRotes.signUp);
  }

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['delivery_approve'] == 1 ||
              response['data']['delivery_approve'] == "1") {
            if (response['data']['approve'] != "0") {
              myServices.sharedPref
                  .setString("id", response['data']['delivery_id'].toString());
              myServices.sharedPref.setString("valPassword", password.text);
              String deliveryId = myServices.sharedPref.getString("id")!;
              myServices.sharedPref
                  .setString("username", response['data']['delivery_name']);
              myServices.sharedPref
                  .setString("email", response['data']['delivery_email']);
              myServices.sharedPref
                  .setString("phone", response['data']['delivery_phone']);
              FirebaseMessaging.instance.subscribeToTopic("delivery");
              FirebaseMessaging.instance
                  .subscribeToTopic("delivery$deliveryId");
              myServices.sharedPref.setString("step", "2");
              Get.offNamed(AppRotes.homePage);
            } else {
              Get.defaultDialog(
                confirm: MaterialButton(
                  color: AppColor.secondColor,
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "210".tr,
                    style: const TextStyle(color: AppColor.backGround),
                  ),
                ),
                title: "98".tr,
                middleText: "209".tr,
              );
            }
          } else {
            Get.offNamed(AppRotes.verifyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
            title: "54".tr,
            middleText: "55".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("165".tr);
    }
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
}
