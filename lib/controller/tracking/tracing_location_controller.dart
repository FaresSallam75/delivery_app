import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/controller/orders/accepted_controller.dart';
import 'package:delivery_app/core/class/statusrequest.dart';
import 'package:delivery_app/core/constant/rotesname.dart';
import 'package:delivery_app/core/function/get_decode_polyline.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TracingLocationController extends GetxController {
  late StreamSubscription<Position> positionStream;
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  GoogleMapController? completer;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  Set<Polyline> ploylineSet = {};
  MyServices myServices = Get.find();
  Timer? timer;

  AcceptedOrdersController acceptedOrdersController = Get.find();

  double? detinationLat;
  double? detinationLong;
  double? currentLat;
  double? currentLong;

  
  @override
  void onInit() {
    super.onInit();
    ordersModel = Get.arguments['ordersmodel'];
    getCurrectPosition();
    getPloylineDestination();
    refreshLocation();
  }

  @override
  void onClose() {
    super.onClose();
    positionStream.cancel();
    completer!.dispose();
    timer!.cancel();
  }

  doneDelivery() async {
    statusRequest = StatusRequest.loading;
    update();
    await acceptedOrdersController.doneDeliveryOrders(
        ordersModel.ordersId!, ordersModel.ordersUsersid!);
    Get.offAllNamed(AppRotes.homePage);
  }

  getCurrectPosition() {
    cameraPosition = CameraPosition(

      target: LatLng(
        double.parse(ordersModel.addressLatt!),
        double.parse(ordersModel.addressLong!),
      ),
      zoom: 12.4746,
    );

    // location for users
    markers.add(
      Marker(
        markerId: const MarkerId("destination"),
        position: LatLng(
          double.parse(ordersModel.addressLatt!),
          double.parse(ordersModel.addressLong!),
        ),
      ),
    );

    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      print("===================== Current Position");
      print("===================== ${position!.latitude} ");
      print("===================== ${position.longitude} ");

      currentLat = position.latitude;
      currentLong = position.longitude;

      if (completer != null) {
        completer!.animateCamera(
            CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)));
      }
      markers.removeWhere((element) => element.markerId.value == "current");

      // location for delivery man
      markers.add(
        Marker(
          markerId: const MarkerId("current"),
          position: LatLng(
            currentLat!,
            currentLong!,
          ),
        ),
      );
     
    });
    update();
  }

  getPloylineDestination() async {
    detinationLat = double.parse(ordersModel.addressLatt!);
    detinationLong = double.parse(ordersModel.addressLong!);
    await Future.delayed(const Duration(seconds: 1));
    ploylineSet = await getPolyline(
        currentLat, currentLong, detinationLat, detinationLong);
    update();
  }

  refreshLocation() async {
    await Future.delayed(const Duration(seconds: 2));
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc(ordersModel.ordersId)
          .set({
        "lat": currentLat,
        "long": currentLong,
        "deliverId": myServices.sharedPref.getString("id"),
      });
    });
    update();
  }

}
