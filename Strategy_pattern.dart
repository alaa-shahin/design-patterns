void main() {
  Context context1 = Context(OperationMultiply());
  print('10 * 5 = ${context1.executeStrategy(10, 5)}');
  print('----------------');
  Context context2 = Context(OperationAdd());
  print('10 + 5 = ${context2.executeStrategy(10, 5)}');
  print('----------------');
  Context context3 = Context(OperationSubtract());
  print('10 - 5 = ${context3.executeStrategy(10, 5)}');
  print('End the program');
}

abstract class Strategy {
  int doOperation(int num1, int num2);
}

class OperationAdd implements Strategy {
  int doOperation(int num1, int num2) {
    return num1 + num2;
  }
}

class OperationSubtract implements Strategy {
  int doOperation(int num1, int num2) {
    return num1 - num2;
  }
}

class OperationMultiply implements Strategy {
  int doOperation(int num1, int num2) {
    return num1 * num2;
  }
}

class Context {
  late Strategy strategy;

  Context(Strategy strategy) {
    this.strategy = strategy;
  }

  int executeStrategy(int num1, int num2) {
    return strategy.doOperation(num1, num2);
  }
}
