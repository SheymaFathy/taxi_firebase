import 'package:fb_taxi/res/font_manager.dart';
import 'package:flutter/material.dart';

import '../res/color_manager.dart';


class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.press,
    required this.text,
  });
  final String text;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        maximumSize: Size(MediaQuery.sizeOf(context).width, 50),
        minimumSize: Size(MediaQuery.sizeOf(context).width, 50),
      ),
      onPressed: press,
      child: Text(text, style: FontManager.w600s16cW),
    );
  }
}
