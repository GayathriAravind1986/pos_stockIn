import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/Reusable/formatter.dart';
import 'package:simple/Reusable/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool readOnly;
  final TextEditingController controller;
  final Color baseColor;
  final Color borderColor;
  final Color errorColor;
  final TextInputType inputType;
  final bool obscureText;
  final int maxLength;
  final int? maxLine;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final bool showSuffixIcon;
  final Widget? suffixIcon;
  final Widget? countryCodePicker;
  final String? prefixText;
  final FilteringTextInputFormatter? FTextInputFormatter;
  final bool isUpperCase;
  final bool enableNricFormatter;
  final double? height;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.readOnly,
    required this.controller,
    required this.baseColor,
    required this.borderColor,
    required this.errorColor,
    required this.inputType,
    required this.obscureText,
    required this.maxLength,
    this.maxLine,
    this.onChanged,
    this.onTap,
    this.validator,
    this.showSuffixIcon = false,
    this.suffixIcon,
    this.countryCodePicker,
    this.prefixText,
    this.FTextInputFormatter,
    this.isUpperCase = false,
    this.enableNricFormatter = false,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (countryCodePicker != null) countryCodePicker!,
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: TextSelectionTheme(
              data: const TextSelectionThemeData(
                cursorColor: appPrimaryColor,
                selectionColor: appPrimaryColor,
                selectionHandleColor: appPrimaryColor,
              ),
              child: TextFormField(
                style: MediaQuery.of(context).size.width >= 650 &&
                        MediaQuery.of(context).size.width < 1100
                    ? MyTextStyle.f14(blackColor, weight: FontWeight.w400)
                    : MyTextStyle.f16(blackColor, weight: FontWeight.w400),
                controller: controller,
                readOnly: readOnly,
                obscureText: obscureText,
                keyboardType: inputType,
                expands: false,
                textCapitalization: isUpperCase
                    ? TextCapitalization.characters
                    : TextCapitalization.none,
                inputFormatters: [
                  if (FTextInputFormatter != null) FTextInputFormatter!,
                  if (isUpperCase)
                    FilteringTextInputFormatter.allow(RegExp("[A-Z0-9 ]")),
                  if (enableNricFormatter) NricFormatter(separator: '-'),
                  LengthLimitingTextInputFormatter(maxLength),
                ],
                maxLength: maxLength,
                maxLines: maxLine ?? 1,
                onChanged: onChanged,
                onTap: onTap,
                validator: validator,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: height ?? 10.0,
                    horizontal: 10.0,
                  ),
                  counterText: "",
                  hintText: hint,
                  hintStyle: MediaQuery.of(context).size.width >= 650 &&
                          MediaQuery.of(context).size.width < 1100
                      ? MyTextStyle.f14(greyColor, weight: FontWeight.w300)
                      : MyTextStyle.f18(greyColor, weight: FontWeight.w300),
                  prefixText: prefixText, // Add prefix text
                  prefixStyle: MediaQuery.of(context).size.width >= 650 &&
                          MediaQuery.of(context).size.width < 1100
                      ? MyTextStyle.f14(blackColor, weight: FontWeight.w300)
                      : MyTextStyle.f18(blackColor, weight: FontWeight.w300),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: baseColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: errorColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: showSuffixIcon ? suffixIcon : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
