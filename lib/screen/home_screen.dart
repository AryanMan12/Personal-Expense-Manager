import 'package:flutter/material.dart';
import 'package:personal_expense_manager/common/widget/expense_card.dart';
import 'package:personal_expense_manager/common/widget/expense_summary.dart';
import 'package:personal_expense_manager/data/models/transaction.dart';

import '../data/enums/payment_mode.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String Currency = "\$";
    List<Transaction> transactions = List<Transaction>.empty(growable: true);
    transactions.add(new Transaction(
        amount: 59, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(
        amount: 100, isExpense: false, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(
        amount: 5000, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(
        amount: 300, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(
        amount: 10000, isExpense: false, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(
        amount: 30, isExpense: false, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(
        amount: 1125, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(
        amount: 5000, isExpense: true, paymentMode: PaymentMode.UPI));
    int totalIncome = 0;
    int totalExpense = 0;
    for (Transaction transaction in transactions) {
      if (transaction.isExpense) {
        totalExpense += transaction.amount;
      } else {
        totalIncome += transaction.amount;
      }
    }

    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  // Shadow for top-left corner
                  const BoxShadow(
                    color: Colors.grey,
                    offset: Offset(10, 10),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                  // Shadow for bottom-right corner
                  const BoxShadow(
                    color: Colors.white12,
                    offset: Offset(-10, -10),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ]),
            child: ExpenseSummary(
              totalIncome: totalIncome,
              totalExpense: totalExpense,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "Transactions",
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          flex: 10,
          child: ListView(
            children: transactions
                .map(
                  (e) => ExpenseCard(
                    transaction: e,
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
