import 'dart:io';
import 'logger_interface.dart';

class FileLogOutput implements LogOutput {
  FileLogOutput(String filePath) : _logFile = File(filePath);
  final File _logFile;

  @override
  void output(LogLevel level, String message,
      {Exception? exception, StackTrace? stackTrace}) {
    final logMessage = '${DateTime.now()} [$level]: $message';
    final buffer = StringBuffer(logMessage);
    if (exception != null) {
      buffer.writeln('\nException: $exception');
    }
    if (stackTrace != null) {
      buffer.writeln('\nStackTrace: $stackTrace');
    }
    buffer.writeln();
    _logFile.writeAsStringSync(buffer.toString(), mode: FileMode.append);
  }
}
