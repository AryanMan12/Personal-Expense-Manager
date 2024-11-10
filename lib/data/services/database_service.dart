import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:personal_expense_manager/data/services/injection_container.dart';
import 'package:personal_expense_manager/data/providers/interface/icounter_party_provider.dart';
import 'package:personal_expense_manager/data/providers/interface/itransaction_provider.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> getDatabase() async {
    final databaseDirectory = await getDatabasesPath();
    final databasePath = join(databaseDirectory, "masterDB.db");
    final ITransactionProvider transactionProvider = locator<ITransactionProvider>();
    final ICounterPartyProvider counterPartyProvider = locator<ICounterPartyProvider>();
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
