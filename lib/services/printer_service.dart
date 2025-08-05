abstract class PrinterService {
  /// Initialize the printer (e.g., connect, setup)
  Future<void> init();

  /// Set text alignment: "left", "center", or "right"
  Future<void> setAlignment(String align);

  /// Print text with optional style
  Future<void> printText(String text, {dynamic style});

  /// Line feed (new lines after print)
  Future<void> printAndLineFeed();

  /// Cut the paper (if supported by the printer)
  Future<void> cut();
}
