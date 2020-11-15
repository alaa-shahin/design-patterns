import 'dart:io';

void main() {
  String bankCode;
  
  BankFactory bankFactory = BankFactory();
  
  stdout.writeln('Enter Your Card Number');
  String cardNumber = stdin.readLineSync();
  bankCode = cardNumber.substring(0,6);
  IBank bank = bankFactory.getbank(bankCode);
  print(bank.withdraw());
}

abstract class IBank {
   String withdraw();
}

class BankA implements IBank{
  String withdraw(){
    return 'your request is handling by BankA';
  }
}

class BankB implements IBank{
  String withdraw(){
    return 'your request is handling by BankB';
  }
}

abstract class IBankFactory {
  IBank getbank(String bankCode);
}

class BankFactory implements IBankFactory {
  IBank getbank(String bankcode){
    switch(bankcode){
      case '123456':
        return BankA();
      case '111111':
        return BankB();
      default:
        print('invalid input');
        exit(0);
    }
  }
}
