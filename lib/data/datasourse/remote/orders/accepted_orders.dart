
import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class AcceptedOrdersData {
  Crud crud;
  AcceptedOrdersData(this.crud);
  getAcceptedOrders(String deliveryId) async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {
      "deliveryid" : deliveryId
    });
    return response.fold((l) => l, (r) => r);
  }
  doneDeliveryOrders(String ordersId , String usersId) async {
    var response = await crud.postData(AppLink.doneOrders, {
      "ordersid" : ordersId , "usersid" : usersId
    });
    return response.fold((l) => l, (r) => r);
  }

 
}
