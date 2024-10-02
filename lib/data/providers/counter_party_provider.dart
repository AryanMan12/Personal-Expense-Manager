import 'package:flutter_guid/flutter_guid.dart';
import 'package:personal_expense_manager/data/providers/base_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/counter_party.dart';
import '../services/database_service.dart';

class CounterPartyProvider extends BaseProvider {
  @override
  String tableName = "CounterParty";
  String nameColumn = "name";
  String descriptionColumn = "description";
  String balanceColumn = "balance";
  String partyTypeColumn = "partyType";

  @override
  void createTable(Database db) {
    db.execute('''
      CREATE TABLE $tableName (
        $idColumn TEXT NOT NULL PRIMARY KEY,
        $nameColumn TEXT NOT NULL,
        $descriptionColumn TEXT NOT NULL,
        $balanceColumn INTEGER NOT NULL,
        $partyTypeColumn INTEGER NOT NULL,
        $createdDateColumn INTEGER NOT NULL,
        $modifiedDateColumn INTEGER NOT NULL
      )
    ''');
  }

  Future addCounterParty(CounterParty obj) async {
    Database db = await DatabaseService.instance.getDatabase();
    await db.insert(tableName, obj.toMap());
  }

  Future<CounterParty> getCounterPartyById(Guid id) async {
    Database db = await DatabaseService.instance.getDatabase();

    return CounterParty.fromMap(
      (await db.query(tableName, where: '$idColumn = ?', whereArgs: [id]))[0],
    );
  }
}
