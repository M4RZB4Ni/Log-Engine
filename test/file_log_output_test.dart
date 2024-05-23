import 'dart:io';
import 'package:test/test.dart';
import 'package:log_engine/log_engine.dart';

void main() {
  group('FileLogOutput', () {
    const filePath = 'test_logs.txt';
    late FileLogOutput fileLogOutput;

    setUp(() {
      fileLogOutput = FileLogOutput(filePath);
    });

    tearDown(() {
      final file = File(filePath);
      if (file.existsSync()) {
        file.deleteSync();
      }
    });

    test('writes log messages to file', () {
      fileLogOutput.output(LogLevel.info, 'Info message');

      final logFile = File(filePath);
      expect(logFile.existsSync(), true);
      expect(logFile.readAsStringSync(), contains('Info message'));
    });

    test('appends log messages to file', () {
      fileLogOutput.output(LogLevel.info, 'First message');
      fileLogOutput.output(LogLevel.info, 'Second message');

      final logFile = File(filePath);
      expect(logFile.readAsStringSync(), contains('First message'));
      expect(logFile.readAsStringSync(), contains('Second message'));
    });
  });
}
