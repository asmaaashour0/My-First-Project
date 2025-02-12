import 'package:flutter/material.dart';

import '../../../core/constant/appcolor.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final IconData icondata;
  final bool active;
  const CustomButtonAppBar({
    super.key,
    required this.onPressed,
    required this.textbutton,
    required this.icondata,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icondata,
            color: active == true ? Colors.blue : AppColor.gray2,
          ),
          Text(
            textbutton,
            style: TextStyle(
              color: active == true ? Colors.blue : AppColor.gray2,
            ),
          ),
        ],
      ),
    );
  }
}
