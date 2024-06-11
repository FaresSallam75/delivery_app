import 'package:delivery_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String textButton;
  final IconData iconData;
  final bool activeColor;
  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      required this.textButton,
      required this.iconData,
      required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color:
                activeColor == true ? AppColor.secondColor : AppColor.greyDark,
          ),
          Text(
            textButton,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontFamily: "sans",
                color: activeColor == true
                    ? AppColor.secondColor
                    : AppColor.greyDark),
          ),
        ],
      ),
    );
  }
}
