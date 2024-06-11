import 'dart:async';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/function/handlingdata_controller.dart';
import 'package:delivery_app/data/datasourse/remote/orders/details_orders.dart';
import 'package:delivery_app/data/model/cartmodel.dart';
import 'package:delivery_app/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
  late Completer<GoogleMapController> completerController;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  DetailsOrdersData detailsOrdersData = DetailsOrdersData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

  getCurrentLocation() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(ordersModel.addressLatt!),
          double.parse(ordersModel.addressLong!),
        ),
        zoom: 12.4746,
      );
      markers.add(
        Marker(
          markerId: const MarkerId("1"),
          position: LatLng(
            double.parse(ordersModel.addressLatt!),
            double.parse(ordersModel.addressLong!),
          ),
        ),
      );
    }
    update();
  }

  getOrdersDetailsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await detailsOrdersData.detailsOrdersData(ordersModel.ordersId!);
    print("=============================== ==========================");
    print("=============================== Controller $response ");
    print("=============================== ==========================");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    ordersModel = Get.arguments['ordersmodel'];
    getCurrentLocation();
    getOrdersDetailsData();
    completerController = Completer<GoogleMapController>();
  }

  goToPageTracing() {
    Get.toNamed(AppRotes.ordersTracing,
        arguments: {"ordersmodel": ordersModel});
  }
}
