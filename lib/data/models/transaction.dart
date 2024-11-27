import 'package:flutter_guid/flutter_guid.dart';
import 'package:personal_expense_manager/data/models/base_table.dart';

class TransactionModel extends BaseTable {
  // model attributes
  Guid senderId;
  Guid receiverId;
  String description;
  double amount;
  bool isExpense;
  DateTime transactionDateTime = DateTime.now();

  TransactionModel({
    this.description = "",
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.isExpense,
  }) : super();

  // Convert a Map to a Transaction object
  factory TransactionModel.fromMap(Map<String, Object?> map) {
    TransactionModel transaction = TransactionModel(
      description: map['description'] as String,
      senderId: Guid(map['senderId'] as String),
      receiverId: Guid(map['receiverId'] as String),
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
      'id': id,
      'sender': senderId,
      'receiver': receiverId,
      'description': description,
      'amount': amount,
      'isExpense': isExpense,
      'transactionDateTime': transactionDateTime,
      'createdDate': createdDate.millisecondsSinceEpoch,
      'modifiedDate': modifiedDate.millisecondsSinceEpoch
    };
  }
}
