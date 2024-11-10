import 'dart:core';
import 'package:sqflite/sqflite.dart';
import 'package:personal_expense_manager/data/models/transaction.dart' as transaction;

abstract class ITransactionProvider {
  void createTable(Database db);
  Future insert(transaction.Transaction obj);
  Future<List<transaction.Transaction>> fetchAllOrderedByDateTimeDesc();
}