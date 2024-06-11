import 'package:delivery_app/controller/setting/setting_controller.dart';
import 'package:delivery_app/core/class/handlingdataview.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      body: GetBuilder<SettingController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.deliveryList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 150,
                        backgroundImage: NetworkImage(
                            "${AppLink.imageDelivery}/${controller.deliveryList[index].deliveryImage}"),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "${controller.deliveryList[index].deliveryName}",
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "${controller.deliveryList[index].deliveryEmail}",
                        // ignore: deprecated_member_use
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                if (controller.isLoading == true)
                  const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.secondColor,
                    ),
                  ),
                const Spacer(),
                AdvancedSwitch(
                  onChanged: (value) {
                    if (controller.myServices.sharedPref.getString("lang") ==
                        "ar") {
                      controller.changeLanguage("en");
                    } else {
                      controller.changeLanguage("ar");
                    }
                  },
                  controller: controller.switcherController,
                  // activeImage: const AssetImage('assets/day_sky.png'),
                  // inactiveImage: const AssetImage('assets/night_sky.jpg'),
                  activeColor: AppColor.secondColor,
                  inactiveColor: AppColor.secondColor,
                  activeChild:
                      controller.myServices.sharedPref.getString("lang") == "ar"
                          ? Text("120".tr)
                          : Text("121".tr),
                  inactiveChild:
                      controller.myServices.sharedPref.getString("lang") == "en"
                          ? Text("121".tr)
                          : Text("120".tr),
                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                  width: 100.0,
                  height: 45.0,
                  enabled: true,
                  disabledOpacity: 0.5,
                ),
                const SizedBox(height: 5.0),
                InkWell(
                  onTap: () {
                    //controller.myServices.sharedPref.clear();
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color:
                        AppColor.secondColor, // AppColor.grey.withOpacity(0.1),
                    child: ListTile(
                      onTap: () {
                        controller.logout();
                      },
                      title: Text("203".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: AppColor.backGround)),
                      trailing: const Icon(
                        Icons.logout,
                        color: AppColor.backGround,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
