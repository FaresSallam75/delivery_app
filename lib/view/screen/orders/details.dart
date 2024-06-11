import 'package:delivery_app/controller/orders/orders_details_controller.dart';
import 'package:delivery_app/core/class/handlingdataview.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/function/translatedatabase.dart';
import 'package:delivery_app/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("130".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrdersDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Table(
                          border: TableBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          children: [
                            TableRow(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.vertical(
                                          bottom: Radius.circular(20.0)),
                                  color: AppColor.thirdColor),
                              children: [
                                Text("167".tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                Text("132".tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                                Text("76".tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium)
                              ],
                            ),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(
                                children: [
                                  Text(
                                    "${translateDatabase(controller.data[index].itemsNameAr, controller.data[index].itemsName)}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontFamily: "sans", fontSize: 16.0),
                                  ),
                                  Text(
                                    "${controller.data[index].countitems}",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontFamily: "sans", fontSize: 16.0),
                                  ),
                                  Text(
                                    "${controller.data[index].itemsprice} \$",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                            fontFamily: "sans", fontSize: 16.0),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${"76".tr} : ${controller.ordersModel.ordersPrice} \$",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontFamily: "sans"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${"133".tr} : ${controller.ordersModel.ordersPricedelivery} \$",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontFamily: "sans"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${"78".tr} : ${controller.ordersModel.ordersTotalprice} \$",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontSize: 20.0,
                                    fontFamily: "sans",
                                    color: AppColor.secondColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.ordersModel.ordersType == "0")
                  ListTile(
                    title: Text(
                      "87".tr,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      "${controller.ordersModel.addressCity}  ${controller.ordersModel.addressStreet}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                if (controller.ordersModel.ordersType == "0")
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 12),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        markers: controller.markers.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.completerController
                              .complete(controllerMap);
                        },
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                if (controller.ordersModel.ordersType == "0" &&
                    controller.ordersModel.ordersStatus == "3")
                  CustomButtonAuth(
                    text: "137".tr,
                    onBressed: () {
                      controller.goToPageTracing();
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
