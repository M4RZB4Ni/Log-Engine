# Log Engine

Log Engine is a flexible and extensible logging module for Dart and Flutter applications. It provides a simple interface for logging messages at various levels and supports multiple output targets such as the console and files.

## Features

- Log messages at different levels: debug, info, warning, error, fatal.
- Easily switch log output targets (console, file).
- Configure log levels to filter messages.
- Customizable log output implementations.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  log_engine:
    path: path/to/log_engine
```
## Usage
Quick Start
Here's an example of how to use the Log Engine in a Flutter or Dart application
```
mport 'package:log_engine/log_engine.dart';

void main() {
  final logger = Logger();

  // Set the log output to console
  logger.setOutput(ConsoleLogOutput());

  // Set the log level to info
  logger.setLogLevel(LogLevel.info);

  // Log messages
  logger.logInfo('This is an info message');
  logger.logError('This is an error message', exception: Exception('Sample exception'));

  // Set the log output to a file
  logger.setOutput(FileLogOutput('logs/app.log'));

  // Log messages to the file
  logger.logDebug('This is a debug message');
}
```
Log Levels
The **LogLevel** enum defines the severity of log messages:

- LogLevel.debug
- LogLevel.info
- LogLevel.warning
- LogLevel.error
- LogLevel.fatal

Set the log level to control which messages are output:
```
logger.setLogLevel(LogLevel.warning);
```
Log Outputs
Log Engine supports multiple log outputs. You can implement your own by extending the **LogOutput** abstract class.

ConsoleLogOutput
Logs messages to the console:
```
logger.setOutput(ConsoleLogOutput()); 
```
FileLogOutput
Logs messages to a file:
```
logger.setOutput(FileLogOutput('logs/app.log'));
```
Extending Log Engine
You can create custom log outputs by implementing the **LogOutput** interface:
```
class MyCustomLogOutput implements LogOutput {
  @override
  void output(LogLevel level, String message, {Exception? exception, StackTrace? stackTrace}) {
    // Custom implementation
  }
}
```
Testing
Log Engine includes a comprehensive set of unit tests. To run the tests, use the following command:
```
flutter test 
```
or, if you are using Dart only:
```
dart test 
```
Ensure you have the test package included in your pubspec.yaml under dev_dependencies:
```
dev_dependencies:
  test: (latest_version)
```
**Project Structure**
```
lib/
  src/
    console_log_output.dart
    file_log_output.dart
    logger.dart
    logger_interface.dart
  log_engine.dart

test/
  logger_interface_test.dart
  logger_test.dart
  file_log_output_test.dart
  console_log_output_test.dart
```