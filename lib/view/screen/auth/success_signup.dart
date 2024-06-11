import 'package:delivery_app/controller/auth/successsignup_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "34".tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.secondColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.orange,
            ),
            Text(
              textAlign: TextAlign.center,
              "30".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColor.secondColor),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "33".tr,
                onBressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            /*    const SizedBox(
              height: 30,
            ) */
          ],
        ),
      ),
    );
  }
}
