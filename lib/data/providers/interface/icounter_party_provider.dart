import 'package:sqflite/sqflite.dart';
import 'package:flutter_guid/flutter_guid.dart';

import 'package:personal_expense_manager/data/models/counter_party.dart';

abstract class ICounterPartyProvider{
  void createTable(Database db);
  Future insert(CounterParty obj);
  Future<CounterParty> get(Guid id);
}