import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/function/handlingdata_controller.dart';
import 'package:delivery_app/data/datasourse/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordComtroller extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordComtrollerImp extends ResetPasswordComtroller {
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRotes.successResetPassword);
  }

  @override
  resetPassword() async {
    var formData = formState.currentState;
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
        title: "Warning",
        middleText: "Password Not Match",
        titleStyle: const TextStyle(fontSize: 15, color: Colors.orange),
      );
    }

    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRotes.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "alert",
            middleText: "You cannot use the same previous password",
            titleStyle: const TextStyle(fontSize: 15, color: Colors.orange),
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();

    super.dispose();
  }
}
