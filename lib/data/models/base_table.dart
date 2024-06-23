import 'package:flutter_guid/flutter_guid.dart';

abstract class BaseTable{
  late Guid id;
  static String? tableName;

  BaseTable(){
    id = Guid.newGuid;
  }

}

