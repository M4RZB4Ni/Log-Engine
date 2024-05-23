/// Abstract class defining logging operations and configurations.
abstract class ILogger {
  /// Logs a debug message.
  ///
  /// @param message The debug message to be logged.
  /// @param exception An optional exception associated with the debug message.
  /// @param stackTrace An optional stack trace associated with the debug message.
  void logDebug(String message, {Exception? exception, StackTrace? stackTrace});

  /// Logs an informational message.
  ///
  /// @param message The informational message to be logged.
  /// @param exception An optional exception associated with the informational message.
  /// @param stackTrace An optional stack trace associated with the informational message.
  void logInfo(String message, {Exception? exception, StackTrace? stackTrace});

  /// Logs a warning message.
  ///
  /// @param message The warning message to be logged.
  /// @param exception An optional exception associated with the warning message.
  /// @param stackTrace An optional stack trace associated with the warning message.
  void logWarning(String message,
      {Exception? exception, StackTrace? stackTrace});

  /// Logs an error message.
  ///
  /// @param message The error message to be logged.
  /// @param exception An optional exception associated with the error message.
  /// @param stackTrace An optional stack trace associated with the error message.
  void logError(String message, {Exception? exception, StackTrace? stackTrace});

  /// Logs a fatal error message.
  ///
  /// @param message The fatal error message to be logged.
  /// @param exception An optional exception associated with the fatal error message.
  /// @param stackTrace An optional stack trace associated with the fatal error message.
  void logFatal(String message, {Exception? exception, StackTrace? stackTrace});

  /// Sets the output destination for log messages.
  ///
  /// @param output The output destination for log messages.
  void setOutput(LogOutput output);

  /// Sets the log level for filtering log messages.
  ///
  /// @param level The log level to be set.
  void setLogLevel(LogLevel level);
}

/// Enum representing different log levels.
enum LogLevel { debug, info, warning, error, fatal }

/// Abstract class defining methods to output log messages.
abstract class LogOutput {
  /// Outputs a log message with the specified log level.
  ///
  /// @param level The log level of the message.
  /// @param message The message to be logged.
  /// @param exception An optional exception associated with the message.
  /// @param stackTrace An optional stack trace associated with the message.
  void output(LogLevel level, String message,
      {Exception? exception, StackTrace? stackTrace});
}
