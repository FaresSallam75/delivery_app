import 'package:delivery_app/controller/tracking/tracing_location_controller.dart';
import 'package:delivery_app/core/class/handlingdataview.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersTracing extends StatelessWidget {
  const OrdersTracing({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TracingLocationController());
    return Scaffold(
      appBar: AppBar(
        title: Text("207".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<TracingLocationController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                if (controller.ordersModel.ordersType == "0")
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 300,
                      width: double.infinity,
                      child: GoogleMap(
                        polylines: controller.ploylineSet,
                        markers: controller.markers.toSet(),
                        mapType: MapType.normal,
                        initialCameraPosition: controller.cameraPosition!,
                        onMapCreated: (GoogleMapController controllerMap) {
                          controller.completer = controllerMap;
                        },
                      ),
                    ),
                  ),
                SizedBox(
                  height: 40,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    minWidth: Get.width - 50,
                    color: AppColor.secondColor,
                    textColor: AppColor.backGround,
                    onPressed: () {
                      controller.doneDelivery();
                    },
                    child: Text(
                      "208".tr,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColor.backGround),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
