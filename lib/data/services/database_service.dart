import 'package:path/path.dart';
import 'package:personal_expense_manager/data/providers/counter_party_provider.dart';
import 'package:personal_expense_manager/data/providers/transaction_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> getDatabase() async {
    final databaseDirectory = await getDatabasesPath();
    final databasePath = join(databaseDirectory, "masterDB.db");
    final TransactionProvider transactionProvider = TransactionProvider();
    final CounterPartyProvider counterPartyProvider = CounterPartyProvider();
    final database = openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        switch (version) {
          case 1:
            // Creating tables
            transactionProvider.createTable(db);
            counterPartyProvider.createTable(db);
        }
      },
    );

    return database;
  }
}
