import 'package:flutter/cupertino.dart';
import 'package:simple/Reusable/color.dart';

verticalSpace({double height = 8.0}) {
  return SizedBox(
    height: height,
  );
}

horizontalSpace({double width = 8.0}) {
  return SizedBox(
    width: width,
  );
}

appButton(
    {double height = 0.0,
    double width = 0.0,
    double font = 14, // Font size is passed as a parameter
    String? buttonText,
    Color? color}) {
  return Center(
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color ?? appPrimaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          buttonText!,
          style: TextStyle(
            fontSize: font, // Set font size from the parameter
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
