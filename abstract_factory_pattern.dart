import 'dart:io';

void main() {
  String bankCode;
  
  BankFactory bankFactory = BankFactory();
  
  stdout.writeln('Enter Your Card Number');
  String cardNumber = stdin.readLineSync();
  bankCode = cardNumber.substring(0,6);
  IBank bank = bankFactory.getBank(bankCode);
  IPaymentCard payment = bankFactory.getPaymentCard('12');
  print(bank.withdraw());
  print(payment.getName());
}

abstract class IBank {
  String withdraw();
}

class BankA implements IBank {
  String withdraw() {
    return 'your request is handling by BankA';
  }
}

class BankB implements IBank {
  String withdraw() {
    return 'your request is handling by BankB';
  }
}

abstract class IBankFactory {
  IBank getBank(String bankCode);
  IPaymentCard getPaymentCard(String cardNumber);
}

class BankFactory implements IBankFactory {
  IBank getBank(String bankcode) {
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

  IPaymentCard getPaymentCard(String cardNumber) {
    switch(cardNumber) {
      case '12':
        return VisaCard();
      case '34':
        return MasterCard();
      default:
        print('invalid input');
        exit(0);
    }
  }
}

abstract class IPaymentCard {
  String getName();
}

class VisaCard implements IPaymentCard {
  String getName() {
    return 'Visa Card';
  }
}

class MasterCard implements IPaymentCard {
  String getName() {
    return 'Master Card';
  }
}
