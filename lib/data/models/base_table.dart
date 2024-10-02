import 'package:flutter_guid/flutter_guid.dart';

abstract class BaseTable {
  late Guid id;
  late DateTime createdDate;
  late DateTime modifiedDate;

  BaseTable() {
    id = Guid.newGuid;
    createdDate = DateTime.now();
    modifiedDate = DateTime.now();
  }

  Map<String, Object> toMap();
}
