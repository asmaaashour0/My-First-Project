import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomButtonLang extends StatelessWidget {
  final String textLang;
  final void Function()? onPreessed;
  const CustomButtonLang(
      {super.key, required this.textLang, required this.onPreessed});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: onPreessed,
          child: Text(
            textLang.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
