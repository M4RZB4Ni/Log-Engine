import 'package:flutter_test/flutter_test.dart';
import 'package:log_engine/log_engine.dart';

void main() {
  group('LogLevel', () {
    test('should contain all log levels', () {
      expect(LogLevel.values.length, 5);
      expect(LogLevel.values, containsAll([LogLevel.debug, LogLevel.info, LogLevel.warning, LogLevel.error, LogLevel.fatal]));
    });
  });
}
