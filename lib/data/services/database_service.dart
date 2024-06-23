import 'package:path/path.dart';
import 'package:personal_expense_manager/data/models/transaction.dart' as transaction;
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future<Database> getDatabase() async {
    final databaseDirectory = await getDatabasesPath();
    final databasePath = join(databaseDirectory, "masterDB.db");

    final database = openDatabase(
      databasePath,
      version:1,
      onCreate: (_db, version) {
        // Creating tables
        transaction.Transaction.createTable(_db);

      },
    );

    return database;
  }
}
