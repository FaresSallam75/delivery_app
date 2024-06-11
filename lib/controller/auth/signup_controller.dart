import 'dart:async';
import 'dart:io';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/function/fileupload.dart';
import 'package:delivery_app/core/function/handlingdata_controller.dart';
import 'package:delivery_app/data/datasourse/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SigupController extends GetxController {
  signUp();
  goToSigninPage();
}

class SigupControllerImp extends SigupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  SignupData signupData = SignupData(Get.find());
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  File? file;
  bool isLoading = false;
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(AppRotes.addDeliveryImage, false);
    isLoading = true;
    Timer.periodic(const Duration(seconds: 4), (timer) {
      isLoading = false;
      update();
    });
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera(AppRotes.addDeliveryImage);
    isLoading = true;
    Timer.periodic(const Duration(seconds: 4), (timer) {
      isLoading = false;
      update();
    });
    update();
  }

  chooseImageOption() {
    showBottomSheetMenuImage(chooseImageGallery, chooseImageCamera);
  }

  @override
  goToSigninPage() {
    Get.offNamed(AppRotes.login);
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map mapData = {
        "username": username.text,
        "password": password.text,
        "email": email.text,
        "phone": phone.text,
      };
      var response = await signupData.signupData(mapData, file);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRotes.verifyCodeSignUp, arguments: {
            "email": email.text,
          });
        } else {
          Get.defaultDialog(
            title: "Watchout",
            middleText: "Phone Number OR Email IS Already Exist",
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  goToImagePage() {
    // var formData = formState.currentState;
    if (formState.currentState!.validate()) {
      Get.toNamed(AppRotes.addDeliveryImage);
    } else {
      // print("Not Valid");
      Get.defaultDialog(title: "alert", middleText: "Not Valid Data");
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
