

import 'package:delivery_app/core/class/crud.dart';
import 'package:delivery_app/linkapi.dart';

class SettingData {
  Crud crud;
  SettingData(this.crud);

  viewDeliveryData(Map data) async {
    var response = await crud.postData(AppLink.viewDelivery, data);
    return response.fold((l) => l, (r) => r);
  }
}
