import 'package:flutter/foundation.dart';
import 'logger_interface.dart';

/// Log output implementation that prints log messages to the console.
class ConsoleLogOutput implements LogOutput {
  /// Outputs a log message with the specified log level to the console.
  ///
  /// @param level The log level of the message.
  /// @param message The message to be logged.
  /// @param exception An optional exception associated with the message.
  /// @param stackTrace An optional stack trace associated with the message.
  @override
  void output(LogLevel level, String message,
      {Exception? exception, StackTrace? stackTrace}) {
    final logMessage = '${DateTime.now()} [$level]: $message';

    // Print the exception details if provided and in debug mode.
    if (exception != null) {
      if (kDebugMode) {
        print('$logMessage\nException: $exception');
      }
    }

    // Print the stack trace if provided and in debug mode.
    if (stackTrace != null) {
      if (kDebugMode) {
        print('$logMessage\nStackTrace: $stackTrace');
      }
    }

    // Print the log message in debug mode.
    if (kDebugMode) {
      print(logMessage);
    }
  }
}
