import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;

  Future<MyServices> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDNDTEUNar8jfRgQDqtgRuDOhJXAlNd0kA",
            appId: "1:333431805343:android:77f948094fc5fafea8d9aa",
            messagingSenderId: "333431805343",
            projectId: "ecommerce-377117"));
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
