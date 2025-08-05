import 'package:flutter/material.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/Reusable/text_styles.dart';

Widget toppingOptionTile({
  required String title,
  required String subtitle,
  required bool isSelected,
  required Function(bool?) onChanged,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: blackColor),
      borderRadius: BorderRadius.circular(8),
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      title: Text(
        title,
        style: MyTextStyle.f14(
          blackColor,
          weight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: MyTextStyle.f12(
          greyColor,
        ),
      ),
      trailing: Checkbox(
        activeColor: appPrimaryColor,
        value: isSelected,
        onChanged: onChanged,
      ),
    ),
  );
}
