import 'package:flutter/material.dart';
import 'package:simple/Reusable/color.dart';

class MyTextStyle {
  static TextStyle f38(Color color,
      {FontWeight? weight,
      FontStyle? fontStyle,
      decorationColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: 38,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w600,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle f32(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 32,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w600);
  }

  static TextStyle f30(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 32,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w600);
  }

  static TextStyle f28(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 32,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w600);
  }

  static TextStyle f26(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 24,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w600);
  }

  static TextStyle f24(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 24,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w600);
  }

  static TextStyle f22(Color color,
      {FontWeight? weight,
      FontStyle? fontStyle,
      decorationColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: 22,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w600,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle f20(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 20,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w500);
  }

  static TextStyle f18(Color color,
      {FontWeight? weight,
      FontStyle? fontStyle,
      decorationColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: 18,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w500,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle f17(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 17,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w500);
  }

  static TextStyle f16(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 16,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w500);
  }

  static TextStyle f15(Color color,
      {FontWeight? weight,
      FontStyle? fontStyle,
      Color? decorationColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: 15,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w500,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle f14(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
    Color? decorationColor,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: 14,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w500,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle f13(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 13,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w500);
  }

  static TextStyle f12(Color color,
      {FontWeight? weight,
      FontStyle? fontStyle,
      Color? decorationColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: 12,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w500,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle f10(Color color,
      {FontWeight? weight,
      FontStyle? fontStyle,
      Color? decorationColor,
      TextDecoration? textDecoration}) {
    return TextStyle(
      fontFamily: "Poppins",
      color: color,
      fontSize: 10,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: weight ?? FontWeight.w500,
      decoration: textDecoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle f8(
    Color color, {
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
        fontFamily: "Poppins",
        color: color,
        fontSize: 8,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: weight ?? FontWeight.w500);
  }
}

DefaultButton({
  double height = 0.0,
  double width = 0.0,
  double font = 15,
  String? buttonText,
  BoxDecoration? decoration,
  required Text child,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: appPrimaryColor,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Center(
      child: Text(
        buttonText!,
        style: MyTextStyle.f14(
          whiteColor,
          weight: FontWeight.w500,
        ),
      ),
    ),
  );
}
