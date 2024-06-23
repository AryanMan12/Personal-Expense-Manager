import 'package:flutter_guid/flutter_guid.dart';
import 'package:personal_expense_manager/data/models/base_table.dart';
import 'package:sqflite/sqflite.dart';

import '../enums/payment_mode.dart';

class CounterParty extends BaseTable{

  late Guid id;
  String description;
  int amount;
  PaymentMode paymentMode;
  bool isExpense;
  DateTime transactionDateTime = DateTime.now();

  CounterParty({ this.description = "", required this.amount, required this.isExpense,required this.paymentMode}):super(){
    this.id = Guid.newGuid;
    this.transactionDateTime = DateTime.now();
  }

  @override
  void createTable(Database db){

  }
}
