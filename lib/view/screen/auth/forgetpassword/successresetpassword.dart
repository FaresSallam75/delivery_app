import 'package:delivery_app/controller/auth/successresetpassword_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("34".tr, style: Theme.of(context).textTheme.titleLarge!),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.orange,
            ),
            Text(
              textAlign: TextAlign.center,
              "38".tr,
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
            /*  const SizedBox(
              height: 30,
            ) */
          ],
        ),
      ),
    );
  }
}
