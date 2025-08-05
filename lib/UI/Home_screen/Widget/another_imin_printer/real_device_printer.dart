import 'dart:io' show Platform;
import 'dart:typed_data';
import 'package:another_imin_printer/enums/print_style_font.dart';
import 'package:another_imin_printer/imin_printer.dart';
import 'package:another_imin_printer/print_style.dart';

import 'imin_abstract.dart';

class RealPrinterService implements IPrinterService {
  final IminPrinter _printer = IminPrinter();

  @override
  Future<void> init() async {
    await _printer.initPrinter();
  }

  @override
  Future<void> printText(String text) async {
    await _printer.printText(text);
  }

  Future<void> printBitmap(Uint8List bytes) async {
    await _printer.printBitmap(bytes);
  }

  @override
  Future<void> fullCut() async {
    await _printer.fullCut();
  }
}
