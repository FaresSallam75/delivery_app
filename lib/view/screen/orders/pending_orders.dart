import 'package:delivery_app/controller/orders/pending_orders_controller.dart';
import 'package:delivery_app/core/class/handlingdataview.dart';
import 'package:delivery_app/view/widget/orders/orderslist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrdersController());
    return Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<PendingOrdersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) =>
                CardOrdersListPending(ordersModel: controller.data[index]),
          ),
        ),
      ),
    );
  }
}
