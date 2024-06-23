import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:personal_expense_manager/data/models/base_table.dart';
import 'package:sqflite/sqflite.dart';
import '../enums/payment_mode.dart';

@JsonSerializable()
class Transaction extends BaseTable{
  static String tableName = "transactions";
  // model attributes
  String description;
  int amount;
  PaymentMode paymentMode;
  bool isExpense;
  DateTime transactionDateTime = DateTime.now();

  Transaction({ this.description = "", required this.amount, required this.isExpense,required this.paymentMode}) : super();

  static void createTable(Database db){
    db.execute('''
      CREATE TABLE $tableName (
        id TEXT NOT NULL PRIMARY KEY,
        description TEXT NOT NULL,
        amount INTEGER NOT NULL,
        paymentMode TEXT NOT NULL,
        isExpense INTEGER NOT NULL,
        transactionDateTime INTEGER NOT NULL
      )
    ''');
  }

  static void addTransaction(Database db, Transaction obj){
    db.insert(
      tableName,
      {

      }
    );
  }
}
