import 'console_log_output.dart';
import 'logger_interface.dart';

class Logger implements ILogger {
  LogOutput _output = ConsoleLogOutput();
  LogLevel _logLevel = LogLevel.debug;

  @override
  void logDebug(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.debug.index) {

      _output.output(LogLevel.debug, message, exception: exception, stackTrace: stackTrace);
    }
  }

  @override
  void logInfo(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.info.index) {
      _output.output(LogLevel.info, message, exception: exception, stackTrace: stackTrace);
    }
  }

  @override
  void logWarning(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.warning.index) {
      _output.output(LogLevel.warning, message, exception: exception, stackTrace: stackTrace);
    }
  }

  @override
  void logError(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.error.index) {
      _output.output(LogLevel.error, message, exception: exception, stackTrace: stackTrace);
    }
  }

  @override
  void logFatal(String message, {Exception? exception, StackTrace? stackTrace}) {
    if (_logLevel.index <= LogLevel.fatal.index) {
      _output.output(LogLevel.fatal, message, exception: exception, stackTrace: stackTrace);
    }
  }

  @override
  void setOutput(LogOutput output) {
    _output = output;
  }

  @override
  void setLogLevel(LogLevel level) {
    _logLevel = level;
  }
}
