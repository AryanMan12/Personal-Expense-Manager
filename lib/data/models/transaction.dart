import 'package:flutter_guid/flutter_guid.dart';

class Transaction{
  late Guid id;
  String description;
  int amount;
  PaymentMode paymentMode;
  TransactionType transactionType;
  DateTime transactionDateTime = DateTime.now();

  Transaction({ this.description = "", required this.amount, required this.transactionType,required this.paymentMode}){
    this.id = Guid.newGuid;
    this.transactionDateTime = DateTime.now();
  }
}

enum PaymentMode { UPI,Cash,Bank_Transfer,Debit_Card,CreditCard }

enum TransactionType {Expense,Income}
