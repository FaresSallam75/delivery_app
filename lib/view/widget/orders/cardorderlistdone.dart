import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListDone extends GetView<AcceptedOrdersController> {
  final OrdersModel ordersModel;
  const CardOrdersListDone({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${"138".tr} :  ${ordersModel.ordersId}",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontFamily: "sans"),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse(ordersModel.ordersDatetime!).fromNow(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColor.secondColor),
                )
              ],
            ),
            const Divider(),
            Text(
              "${"139".tr} : ${controller.printOrderType(ordersModel.ordersType!)}",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            Text(
              "${"140".tr} : ${ordersModel.ordersPrice} \$",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            Text(
              "${"141".tr} : ${ordersModel.ordersPricedelivery} \$ ",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            Text(
              "${"142".tr} : ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)}",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            Text(
              "${"143".tr} : ${controller.printOrderStatus(ordersModel.ordersStatus!)}",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontFamily: "sans"),
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  "${"78".tr} : ${ordersModel.ordersTotalprice} \$",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontFamily: "sans", fontSize: 18.0),
                ),
                const Spacer(),
                MaterialButton(
                  color: AppColor.thirdColor,
                  onPressed: () {
                    Get.toNamed(AppRotes.ordersDetails,
                        arguments: {"ordersmodel": ordersModel});
                  },
                  child: Text(
                    "135".tr,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColor.secondColor),
                  ),
                ),
                const SizedBox(width: 10),
                if (ordersModel.ordersStatus == "3")
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      controller.doneDeliveryOrders(
                          ordersModel.ordersId!, ordersModel.ordersUsersid!);
                    },
                    child: Text(
                      "191".tr,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: AppColor.secondColor),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
