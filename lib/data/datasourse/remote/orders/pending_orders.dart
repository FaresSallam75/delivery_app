
import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);
  getOrdersPending() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  } 
 

  getOrdersApprove(String ordersId, String usersId, String deliveryId ) async {
    var response = await crud.postData(AppLink.approveOrders, {
      "ordersid" : ordersId ,  "usersid" : usersId, "deliveryid" :deliveryId
    });
    return response.fold((l) => l, (r) => r);
  } 


}


