import 'printer_service.dart';

class MockPrinterService implements PrinterService {
  @override
  Future<void> init() async {
    print('[MOCK] Printer initialized');
  }

  @override
  Future<void> setAlignment(align) async {
    print('[MOCK] Alignment set to $align');
  }

  @override
  Future<void> printText(String text, {style}) async {
    print('[MOCK] Printing: $text');
  }

  @override
  Future<void> printAndLineFeed() async {
    print('[MOCK] Line feed');
  }

  @override
  Future<void> cut() async {
    print('[MOCK] Cut paper');
  }
}
