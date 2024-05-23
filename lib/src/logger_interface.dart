abstract class ILogger {
  void logDebug(String message, {Exception? exception, StackTrace? stackTrace});
  void logInfo(String message, {Exception? exception, StackTrace? stackTrace});
  void logWarning(String message,
      {Exception? exception, StackTrace? stackTrace});
  void logError(String message, {Exception? exception, StackTrace? stackTrace});
  void logFatal(String message, {Exception? exception, StackTrace? stackTrace});
  void setOutput(LogOutput output);
  void setLogLevel(LogLevel level);
}

enum LogLevel { debug, info, warning, error, fatal }

abstract class LogOutput {
  void output(LogLevel level, String message,
      {Exception? exception, StackTrace? stackTrace});
}
