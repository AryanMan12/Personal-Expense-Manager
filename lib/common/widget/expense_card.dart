import 'package:flutter/material.dart';

import '../../data/models/transaction.dart';

class ExpenseCard extends StatefulWidget {

  final Transaction transaction;

  const ExpenseCard({Key? key, required this.transaction}):super(key:key);

  @override
  State<ExpenseCard> createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    Color amountColor = (widget.transaction.transactionType == TransactionType.Expense ? Colors.red : Colors.green);
    return Container(
      // height: 70,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Type",
                style: TextStyle(
                    color: amountColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widget.transaction.description,
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Text(
                "\$"+widget.transaction.amount.toString(),
                style: TextStyle(color: amountColor, fontSize: 20),
              )
            ],
          ),
          Row(
            children: [
              Text(widget.transaction.transactionDateTime.toString()),
            ],
          )
        ],
      ),
    );
  }
}
