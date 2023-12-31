import 'package:fb_taxi/res/color_manager.dart';
import 'package:fb_taxi/res/font_manager.dart';
import 'package:flutter/material.dart';


class TextFormFieldRadius extends StatelessWidget {
  const TextFormFieldRadius({
    super.key,
    required this.controller,
    required this.hint,
    this.iconStart,
    this.iconEnd,
    this.topPadding,
    this.keyType,
    this.radius,
    this.validator,
    this.line,
    this.label,
    this.enabled,
    this.ontap,
    this.readOnly,
    this.color,
    this.textStyle,
  });

  final TextEditingController controller;
  final String hint;
  final IconData? iconStart;
  final IconData? iconEnd;
  final double? topPadding;
  final TextInputType? keyType;
  final double? radius;
  final String? Function(String?)? validator;
  final int? line;
  final String? label;
  final bool? enabled;
  final void Function()? ontap;
  final bool? readOnly;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding ?? 0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(radius ?? 30)),
        child: TextFormField(
          onTap: ontap,
          readOnly: readOnly ?? false,
          enabled: enabled,
          validator: validator,
          controller: controller,
          keyboardType: keyType,
          maxLines: line,
          style: FontManager.w400s14cB,
          decoration: inputDecorationDef(
              radius: radius ?? 30,
              label: label,
              hint: hint,
              iconEnd: iconEnd,
              iconStart: iconStart,
              textStyle: textStyle),
        ),
      ),
    );
  }
}

InputDecoration inputDecorationDef(
    {required double radius,
    String? hint,
    IconData? iconStart,
    IconData? iconEnd,
    String? label,
    TextStyle? textStyle}) {
  return InputDecoration(
    //label: Text(label ?? ""),
    isDense: true,
    hintText: hint,
    labelStyle: textStyle ?? FontManager.w500s16cG,
    hintStyle: textStyle ?? FontManager.w500s16cG,
    prefixIcon: iconStart == null ? null : Icon(iconStart),
    suffixIcon: iconEnd == null ? null : Icon(iconEnd),
    prefixIconColor: ColorManager.black,
    suffixIconColor: ColorManager.black,
    contentPadding:
        const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: ColorManager.primary)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: ColorManager.primary)),
    disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: const BorderSide(color: ColorManager.primary, width: 3)),
  );
}
