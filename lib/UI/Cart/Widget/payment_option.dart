import 'package:flutter/material.dart';
import 'package:simple/Reusable/color.dart';

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap; // add onTap

  const PaymentOption({
    Key? key,
    required this.icon,
    required this.label,
    required this.selected,
    this.onTap, // accept it in constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? appPrimaryColor.shade100 : whiteColor,
          border: Border.all(
              color: selected ? appPrimaryColor : greyColor.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }
}
