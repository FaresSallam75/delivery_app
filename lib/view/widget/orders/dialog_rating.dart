/* 
import 'package:delivery_app/controller/orders/archieve_orders_controller.dart';
import 'package:delivery_app/core/constant/colors.dart';
import 'package:delivery_app/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String ordersId) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      // your app's logo?
      // FlutterLogo(size: 100),
      image: Image.asset(
        AppImageAsset.logo,
        height: 100,
        width: 100,
       
      ),
      submitButtonText: 'Submit',
      submitButtonTextStyle: const TextStyle(
          color: AppColor.secondColor, fontWeight: FontWeight.bold),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        // print('rating: ${response.rating}, comment: ${response.comment}');
        ArchieveOrdersController controller = Get.find();
        controller.ratingOrders(ordersId, response.rating, response.comment);
      },
    ),
  );
}
 */