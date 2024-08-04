import 'package:sqflite/sqflite.dart';

abstract class BaseProvider{
  String tableName="Table";
  String idColumn = "id";
  String createdDateColumn="createdDate";
  String modifiedDateColumn="modifiedDate";

  void createTable(Database db);

}