// import 'package:imin_printer/imin_printer.dart';
// import 'package:imin_printer/enums.dart';
// import 'printer_service.dart';
//
// class IminPrinterService implements PrinterService {
//   @override
//   Future<void> init() async => await IminPrinter().initPrinter();
//
//   @override
//   Future<void> setAlignment(String align) async {
//     final map = {
//       "center": IminPrintAlign.center,
//       "right": IminPrintAlign.right,
//       // No "left" enum in plugin — left is default, so skip
//     };
//     if (map.containsKey(align)) {
//       await IminPrinter().setAlignment(map[align]!);
//     }
//   }
//
//   @override
//   Future<void> printText(String text, {style}) async {
//     await IminPrinter().printText(text);
//   }
//
//   @override
//   Future<void> printAndLineFeed() async {
//     await IminPrinter().printAndFeedPaper(3);
//     // Adds 3 new lines
//   }
//
//   @override
//   Future<void> cut() async {
//     await IminPrinter().printAndFeedPaper(5); // ✅ Adds 5 blank lines
//
//
//   }
// }
