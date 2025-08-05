import 'dart:typed_data';

abstract class IPrinterService {
  Future<void> init();
  Future<void> printText(String text);
  Future<void> printBitmap(Uint8List bytes);
  Future<void> fullCut();
}
