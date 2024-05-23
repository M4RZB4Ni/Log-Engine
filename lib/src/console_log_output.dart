import 'package:flutter/foundation.dart';
import 'logger_interface.dart';

class ConsoleLogOutput implements LogOutput {
  @override
  void output(LogLevel level, String message,
      {Exception? exception, StackTrace? stackTrace}) {
    final logMessage = '${DateTime.now()} [$level]: $message';
    if (exception != null) {
      if (kDebugMode) {
        print('$logMessage\nException: $exception');
      }
    }
    if (stackTrace != null) {
      if (kDebugMode) {
        print('$logMessage\nStackTrace: $stackTrace');
      }
    }
    if (kDebugMode) {
      print(logMessage);
    }
  }
}
