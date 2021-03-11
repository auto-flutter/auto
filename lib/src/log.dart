
abstract class Logger {
  void debug(Object o);

  void info(Object o);

  void warning(Object o);

  void error(Object o);
}

class NullLogger implements Logger {
  const NullLogger();

  @override
  void debug(Object o) {}

  @override
  void error(Object o) {}

  @override
  void info(Object o) {}

  @override
  void warning(Object o) {}
}

class ConsoleLogger implements Logger {
  const ConsoleLogger();

  @override
  void debug(Object o) {
    print('debug:$o');
  }

  @override
  void error(Object o) {
    print('error:$o');
  }

  @override
  void info(Object o) {
    print('info:$o');
  }

  @override
  void warning(Object o) {
    print('warning:$o');
  }
}
