

import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class ArchieveOrdersData {
  Crud crud;
  ArchieveOrdersData(this.crud);
  archieveOrdersData(String deliveryId) async {
    var response = await crud.postData(AppLink.viewArchieveOrders, {"id": deliveryId});
    return response.fold((l) => l, (r) => r);
  }


}
