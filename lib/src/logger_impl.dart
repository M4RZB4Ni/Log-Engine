import 'console_log_output.dart';
import 'logger_interface.dart';

/// Logger implementation that logs messages based on a specified log level.
/// Uses a LogOutput to determine where the log messages are outputted.
class Logger implements ILogger {
  // Default log output set to ConsoleLogOutput.
  LogOutput _output = ConsoleLogOutput();
  // Default log level set to debug.
  LogLevel _logLevel = LogLevel.debug;

  /// Logs a debug message if the current log level allows it.
  ///
  /// @param message The debug message to be logged.
  /// @param exception An optional exception associated with the debug message.
  /// @param stackTrace An optional stack trace associated with the debug message.
  @override
  void logDebug(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.debug.index) {
      _output.output(LogLevel.debug, message, exception: exception, stackTrace: stackTrace);
    }
  }

  /// Logs an informational message if the current log level allows it.
  ///
  /// @param message The informational message to be logged.
  /// @param exception An optional exception associated with the informational message.
  /// @param stackTrace An optional stack trace associated with the informational message.
  @override
  void logInfo(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.info.index) {
      _output.output(LogLevel.info, message, exception: exception, stackTrace: stackTrace);
    }
  }

  /// Logs a warning message if the current log level allows it.
  ///
  /// @param message The warning message to be logged.
  /// @param exception An optional exception associated with the warning message.
  /// @param stackTrace An optional stack trace associated with the warning message.
  @override
  void logWarning(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.warning.index) {
      _output.output(LogLevel.warning, message, exception: exception, stackTrace: stackTrace);
    }
  }

  /// Logs an error message if the current log level allows it.
  ///
  /// @param message The error message to be logged.
  /// @param exception An optional exception associated with the error message.
  /// @param stackTrace An optional stack trace associated with the error message.
  @override
  void logError(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.error.index) {
      _output.output(LogLevel.error, message, exception: exception, stackTrace: stackTrace);
    }
  }

  /// Logs a fatal error message if the current log level allows it.
  ///
  /// @param message The fatal error message to be logged.
  /// @param exception An optional exception associated with the fatal error message.
  /// @param stackTrace An optional stack trace associated with the fatal error message.
  @override
  void logFatal(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.fatal.index) {
      _output.output(LogLevel.fatal, message, exception: exception, stackTrace: stackTrace);
    }
  }

  /// Sets the output destination for log messages.
  ///
  /// @param output The output destination to be set.
  @override
  void setOutput(LogOutput output) {
    _output = output;
  }

  /// Sets the log level for filtering log messages.
  ///
  /// @param level The log level to be set.
  @override
  void setLogLevel(LogLevel level) {
    _logLevel = level;
  }
}
