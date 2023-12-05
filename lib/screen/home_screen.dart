import 'package:flutter/material.dart';
import 'package:personal_expense_manager/common/widget/expense_card.dart';
import 'package:personal_expense_manager/data/models/transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = List<Transaction>.empty(growable: true);
    transactions.add(new Transaction(amount: 59, transactionType: TransactionType.Expense, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 100, transactionType: TransactionType.Income, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 5000, transactionType: TransactionType.Expense, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 300, transactionType: TransactionType.Expense, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 10000, transactionType: TransactionType.Income, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 30, transactionType: TransactionType.Income, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 1125, transactionType: TransactionType.Expense, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 5000, transactionType: TransactionType.Expense, paymentMode: PaymentMode.UPI));

    return Column(
      children: [
        Expanded(
          flex: 1,
          child: DropdownButton(items: [
            DropdownMenuItem(
              child: Text("hello"),
            ),
          ], onChanged: (value) => {}),
        ),
        Expanded(
          flex:20,
          child: ListView(
            children: transactions.map((e)=>ExpenseCard(transaction: e,),).toList(),
          ),
        )
      ],
    );
  }
}
