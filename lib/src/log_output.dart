import '../log_engine.dart';

/// Abstract class defining methods to output log messages.
abstract interface class LogOutput {
  /// Outputs a log message with the specified log level.
  ///
  /// @param level The log level of the message.
  /// @param message The message to be logged.
  /// @param exception An optional exception associated with the message.
  /// @param stackTrace An optional stack trace associated with the message.
  void output(LogLevel level, String message,
      {Exception? exception, StackTrace? stackTrace});
}