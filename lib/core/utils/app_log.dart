import 'dart:developer' as developer;

class AppLog {
  static void log(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      error: error,
      stackTrace: stackTrace,
      // level: Level.SEVERE.value,
    );
  }
}
