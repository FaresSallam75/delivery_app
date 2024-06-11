
import 'package:delivery_app/controller/orders/archieve_orders_controller.dart';
import 'package:delivery_app/core/class/handlingdataview.dart';
import 'package:delivery_app/view/widget/orders/card_orders_archieve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedOrders extends StatelessWidget {
  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
  Get.put(ArchieveOrdersController());
    return Scaffold(
      /* appBar: AppBar(
        title: const Text("Archieved Orders"),
        centerTitle: true,
      ), */
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ArchieveOrdersController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  CardOrdersArchieve(ordersModel: controller.data[index]),
            ),
          ),
        ),
      ),
    );
  }
}

