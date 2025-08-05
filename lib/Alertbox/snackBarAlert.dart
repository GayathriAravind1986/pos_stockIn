import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AlertDialogBox.dart';

/// show to build Error Notification Toast
void showToast(String message, BuildContext context, {color}) async {
  CustomNavigate.buildErrorNotification(context, message, color: color);
}
