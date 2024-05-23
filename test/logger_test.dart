import 'package:test/test.dart';
import 'package:log_engine/log_engine.dart';

class MockLogOutput implements LogOutput {
  final List<String> logs = [];

  @override
  void output(LogLevel level, String message, {Exception? exception, StackTrace? stackTrace}) {
    final logMessage = '${DateTime.now()} [$level]: $message';
    logs.add(logMessage);
  }
}

void main() {
  group('Logger', () {
    late Logger logger;
    late MockLogOutput mockOutput;

    setUp(() {
      mockOutput = MockLogOutput();
      logger = Logger();
      logger.setOutput(mockOutput);
    });

    test('logs debug messages when log level is debug', () {
      logger.setLogLevel(LogLevel.debug);
      logger.logDebug('Debug message');

      expect(mockOutput.logs.length, 1);
      expect(mockOutput.logs[0], contains('Debug message'));
    });

    test('does not log debug messages when log level is info', () {
      logger.setLogLevel(LogLevel.info);
      logger.logDebug('Debug message');

      expect(mockOutput.logs.isEmpty, true);
    });

    test('logs info messages when log level is info', () {
      logger.setLogLevel(LogLevel.info);
      logger.logInfo('Info message');

      expect(mockOutput.logs.length, 1);
      expect(mockOutput.logs[0], contains('Info message'));
    });

    test('logs error messages when log level is error', () {
      logger.setLogLevel(LogLevel.error);
      logger.logError('Error message');

      expect(mockOutput.logs.length, 1);
      expect(mockOutput.logs[0], contains('Error message'));
    });

    test('logs fatal messages regardless of log level', () {
      logger.setLogLevel(LogLevel.info);
      logger.logFatal('Fatal message');

      expect(mockOutput.logs.length, 1);
      expect(mockOutput.logs[0], contains('Fatal message'));
    });
  });
}
