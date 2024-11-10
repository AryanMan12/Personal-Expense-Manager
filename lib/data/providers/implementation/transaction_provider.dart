import 'dart:core';
import 'package:personal_expense_manager/data/providers/implementation/base_provider.dart';
import 'package:personal_expense_manager/data/providers/interface/itransaction_provider.dart';
import 'package:personal_expense_manager/data/services/database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:personal_expense_manager/data/models/transaction.dart'
    as transaction;

class TransactionProvider extends BaseProvider implements ITransactionProvider{
  @override
  String tableName = "transactions";
  String senderIdColumn = "senderId";
  String receiverIdColumn = "receiverId";
  String descriptionColumn = "description";
  String amountColumn = "amount";
  String isExpenseColumn = "isExpense";
  String transactionDateTimeColumn = "transactionDateTime";

  @override
  void createTable(Database db) {
    db.execute('''
      CREATE TABLE $tableName (
        $idColumn TEXT NOT NULL PRIMARY KEY,
        $senderIdColumn TEXT NOT NULL,
        $receiverIdColumn TEXT NOT NULL,
        $descriptionColumn TEXT,
        $amountColumn INTEGER NOT NULL,
        $isExpenseColumn INTEGER NOT NULL,
        $transactionDateTimeColumn INTEGER NOT NULL,
        $createdDateColumn INTEGER NOT NULL,
        $modifiedDateColumn INTEGER NOT NULL,
        FOREIGN KEY ($senderIdColumn) REFERENCES CounterParty (id),
        FOREIGN KEY ($receiverIdColumn) REFERENCES CounterParty (id)
      )
    ''');
  }

  Future insert(transaction.Transaction obj) async {
    Database db = await DatabaseService.instance.getDatabase();

    await db.insert(
      tableName,
      obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<transaction.Transaction>> fetchAllOrderedByDateTimeDesc() async {
    Database db = await DatabaseService.instance.getDatabase();
    return (await db.query(tableName,
            orderBy: '$transactionDateTimeColumn DESC'))
        .toList()
        .map((element) => transaction.Transaction.fromMap(element))
        .toList();
  }
}
