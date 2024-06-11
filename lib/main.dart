import 'dart:io';
import 'package:delivery_app/bindings/initialbinding.dart';
import 'package:delivery_app/core/localization/changetranslation.dart';
import 'package:delivery_app/core/localization/translation.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/rotes.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await initialServices();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
 /*    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ), */
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false, 
      title: 'Flutter Demo',
      theme: controller.appTheme,
      //home: const Language(), //const Login(), //const OnBoarding(),
      // routes: routes,
      getPages: routes,
    );
  }
}
   // AIzaSyCAirHEOjv-pf28VIWtBqqKqkKLYC6n9cQ
   // AIzaSyAOVcVg_1EZSgNITnwTunuiYhvI88ybBW8

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
