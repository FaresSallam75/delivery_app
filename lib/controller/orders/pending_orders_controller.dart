import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/controller/tracking/tracing_location_controller.dart';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/function/handlingdata_controller.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/datasourse/remote/orders/pending_orders.dart';
import 'package:delivery_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "85".tr;
    } else {
      return "86".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "82".tr;
    } else {
      return "83".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "145".tr;
    } else if (val == "1") {
      return "146".tr;
    } else if (val == "2") {
      return "147".tr;
    } else if (val == "3") {
      return "148".tr;
    } else {
      return "149".tr;
    }
  }

  getOrdersData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.getOrdersPending();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  approveOrders(String ordersId, String usersId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.getOrdersApprove(
        ordersId, usersId, myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        /* TracingLocationController tracingLocationController =
            Get.put(TracingLocationController()); */
        refreshOrderPage();
        final con = Get.lazyPut(() => AcceptedOrdersController());
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  defineLanguage() async {
    print("======================= start of service ");
    myServices.sharedPref.getString("lang") == "ar"
        ? await Jiffy.setLocale("ar")
        : await Jiffy.setLocale("en");
    update();
    print("======================= end of service ");
  }

  refreshOrderPage() {
    getOrdersData();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    refreshOrderPage();
    defineLanguage();
  }
}
