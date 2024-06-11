import 'package:delivery_app/controller/homepage/homepagescreen_controller.dart';
import 'package:delivery_app/view/widget/homepage/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHomePage extends StatelessWidget {
  const CustomButtonAppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        shape: const CircularNotchedRectangle(),
        //notchMargin: 10,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              controller.listPage.length,
              (index) {
                return Expanded(
                  child: CustomButtonAppBar(
                    textButton: controller.buttonAppBar[index]['title'],
                    iconData: controller.buttonAppBar[index]['icon'],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    activeColor: controller.currentPage == index ? true : false,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
