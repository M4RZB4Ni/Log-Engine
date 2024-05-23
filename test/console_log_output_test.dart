import 'dart:async';

import 'package:test/test.dart';
import 'package:log_engine/log_engine.dart';

void main() {
  group('ConsoleLogOutput', () {
    late ConsoleLogOutput consoleLogOutput;

    setUp(() {
      consoleLogOutput = ConsoleLogOutput();
    });

    test('prints log messages to console', () {
      // Redirect console output for testing
      final buffer = StringBuffer();
      final spec = ZoneSpecification(print: (self, parent, zone, line) {
        buffer.writeln(line);
      });

      Zone.current.fork(specification: spec).run(() {
        consoleLogOutput.output(LogLevel.info, 'Info message');
      });

      expect(buffer.toString(), contains('Info message'));
    });

    test('prints exception to console if provided', () {
      final buffer = StringBuffer();
      final spec = ZoneSpecification(print: (self, parent, zone, line) {
        buffer.writeln(line);
      });

      final exception = Exception('Test exception');

      Zone.current.fork(specification: spec).run(() {
        consoleLogOutput.output(LogLevel.error, 'Error message', exception: exception);
      });

      expect(buffer.toString(), contains('Test exception'));
    });

    test('prints stack trace to console if provided', () {
      final buffer = StringBuffer();
      final spec = ZoneSpecification(print: (self, parent, zone, line) {
        buffer.writeln(line);
      });

      final stackTrace = StackTrace.current;

      Zone.current.fork(specification: spec).run(() {
        consoleLogOutput.output(LogLevel.error, 'Error message', stackTrace: stackTrace);
      });

      expect(buffer.toString(), contains(stackTrace.toString()));
    });
  });
}
