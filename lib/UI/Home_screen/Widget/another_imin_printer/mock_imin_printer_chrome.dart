import 'dart:typed_data';
import 'package:another_imin_printer/imin_printer.dart';
import 'package:flutter/material.dart';
import 'package:simple/UI/Home_screen/Widget/another_imin_printer/imin_abstract.dart';

class MockPrinterService implements IPrinterService {
  final IminPrinter _printer = IminPrinter();
  @override
  Future<void> init() async {
    debugPrint("MockPrinter: init");
  }

  @override
  Future<void> printText(String text) async {
    debugPrint(text);
  }

  Future<void> printBitmap(Uint8List bytes) async {
    await _printer.printBitmap(bytes);
  }

  @override
  Future<void> fullCut() async {
    debugPrint("MockPrinter: fullCut");
  }
}
