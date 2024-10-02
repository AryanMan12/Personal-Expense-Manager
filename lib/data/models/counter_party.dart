import 'package:flutter_guid/flutter_guid.dart';
import 'package:personal_expense_manager/data/models/base_table.dart';
import 'package:personal_expense_manager/data/enums/counter_party_type.dart';

class CounterParty extends BaseTable {
  String name;
  CounterPartyType partyType;
  String description;
  double balance;

  CounterParty({
    this.description = "",
    required this.balance,
    required this.partyType,
    required this.name,
  }) : super();

  factory CounterParty.fromMap(Map<String, Object?> map) {
    CounterParty party = CounterParty(
      balance: map['balance'] as double,
      partyType: counterPartyTypeFromIndex(map['partyType'] as int),
      name: map['name'] as String,
    );
    party.id = Guid(map['id'] as String);
    party.createdDate =
        DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int);
    party.modifiedDate =
        DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int);
    return party;
  }

  @override
  Map<String, Object> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'balance': balance,
      'partyType': partyType,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch
    };
  }
}
