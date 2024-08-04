import 'package:flutter_guid/flutter_guid.dart';
import 'package:personal_expense_manager/data/models/base_table.dart';

class Transaction extends BaseTable {
  // model attributes
  Guid SenderId;
  Guid ReceiverId;
  String description;
  double amount;
  bool isExpense;
  DateTime transactionDateTime = DateTime.now();

  Transaction(
      {this.description = "",
      required this.SenderId,
      required this.ReceiverId,
      required this.amount,
      required this.isExpense})
      : super();

  // Convert a Map to a Transaction object
  factory Transaction.fromMap(Map<String, Object?> map) {
    Transaction transaction = Transaction(
      description: map['description'] as String,
      SenderId: Guid(map['senderId'] as String),
      ReceiverId: Guid(map['receiverId'] as String),
      amount: map['amount'] as double,
      isExpense: map['isExpense'] as bool,
    );
    transaction.id = Guid(map['id'] as String);
    transaction.createdDate =
        DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int);
    transaction.modifiedDate =
        DateTime.fromMillisecondsSinceEpoch(map['modifiedDate'] as int);
    return transaction;
  }

  @override
  Map<String, Object> toMap() {
    return {
      'id': this.id,
      'sender': this.SenderId,
      'receiver': this.ReceiverId,
      'description': this.description,
      'amount': this.amount,
      'isExpense': this.isExpense,
      'transactionDateTime': this.transactionDateTime,
      'createdDate': this.createdDate.millisecondsSinceEpoch,
      'modifiedDate': this.modifiedDate.millisecondsSinceEpoch
    };
  }
}
