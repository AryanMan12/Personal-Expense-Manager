import 'dart:core';
import 'package:personal_expense_manager/data/services/database/database_manager/base_db_columns.dart';
import 'package:personal_expense_manager/data/services/database/database_manager_interfaces/itransactions_db_manager.dart';
import 'package:personal_expense_manager/data/services/database/database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:personal_expense_manager/data/models/transaction.dart';

class TransactionsDbManager extends BaseDbColumns
    implements ITransactionsDbManager {
  String tableName = "transactions";
  String senderIdColumn = "sender_id";
  String receiverIdColumn = "receiver_id";
  String descriptionColumn = "description";
  String amountColumn = "amount";
  String isExpenseColumn = "is_expense";
  String transactionDateTimeColumn = "transaction_date_time";

  @override
  void createTable(Database db) {
    db.execute('''
      CREATE TABLE $tableName (
        $idColumn TEXT NOT NULL PRIMARY KEY AUTOINCREMENT,
        $senderIdColumn TEXT NOT NULL,
        $receiverIdColumn TEXT NOT NULL,
        $descriptionColumn TEXT,
        $amountColumn INTEGER NOT NULL,
        $isExpenseColumn INTEGER NOT NULL,
        $transactionDateTimeColumn INTEGER NOT NULL,
        $createdDateColumn INTEGER NOT NULL,
        $modifiedDateColumn INTEGER NOT NULL,
        FOREIGN KEY ($senderIdColumn) REFERENCES counter_party (id),
        FOREIGN KEY ($receiverIdColumn) REFERENCES counter_party (id)
      )
    ''');
  }

  @override
  Future insert(TransactionModel obj) async {
    Database db = await DatabaseService.instance.getDatabase();

    await db.insert(
      tableName,
      obj.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<TransactionModel>> fetchAllOrderedByDateTimeDesc() async {
    Database db = await DatabaseService.instance.getDatabase();
    return (await db.query(tableName,
            orderBy: '$transactionDateTimeColumn DESC'))
        .toList()
        .map((element) => TransactionModel.fromMap(element))
        .toList();
  }
}
