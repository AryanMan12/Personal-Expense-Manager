import 'package:flutter/material.dart';
import 'package:personal_expense_manager/common/widget/expense_card.dart';
import 'package:personal_expense_manager/common/widget/expense_summary.dart';
import 'package:personal_expense_manager/data/models/transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = List<Transaction>.empty(growable: true);
    transactions.add(new Transaction(amount: 59, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 100, isExpense: false, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 5000, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 300, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 10000, isExpense: false, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 30, isExpense: false, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 1125, isExpense: true, paymentMode: PaymentMode.UPI));
    transactions.add(new Transaction(amount: 5000, isExpense: true, paymentMode: PaymentMode.UPI));
    int totalIncome = 0;
    int totalExpense = 0;
    for(Transaction transaction in transactions){
      if (transaction.isExpense){
        totalExpense += transaction.amount;
      }else{
        totalIncome += transaction.amount;
      }
    }

    return Column(
      children: [
        ExpenseSummary(totalIncome: totalIncome, totalExpense: totalExpense),
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
