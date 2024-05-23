import 'dart:io';
import 'logger_interface.dart';

/// Log output implementation that writes log messages to a file.
class FileLogOutput implements LogOutput {
  /// Creates an instance of FileLogOutput with the specified file path.
  ///
  /// @param filePath The path to the log file where messages will be written.
  FileLogOutput(String filePath) : _logFile = File(filePath);

  // The log file where messages will be written.
  final File _logFile;

  /// Outputs a log message with the specified log level to the log file.
  ///
  /// @param level The log level of the message.
  /// @param message The message to be logged.
  /// @param exception An optional exception associated with the message.
  /// @param stackTrace An optional stack trace associated with the message.
  @override
  void output(LogLevel level, String message,
      {Exception? exception, StackTrace? stackTrace}) {
    final logMessage = '${DateTime.now()} [$level]: $message';
    final buffer = StringBuffer(logMessage);

    // Append exception details if provided.
    if (exception != null) {
      buffer.writeln('\nException: $exception');
    }

    // Append stack trace if provided.
    if (stackTrace != null) {
      buffer.writeln('\nStackTrace: $stackTrace');
    }

    buffer.writeln();

    // Write the log message to the file.
    _logFile.writeAsStringSync(buffer.toString(), mode: FileMode.append);
  }
}
