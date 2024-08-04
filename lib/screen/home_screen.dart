import 'package:flutter/material.dart';
import 'package:personal_expense_manager/common/widget/expense_card.dart';
import 'package:personal_expense_manager/common/widget/expense_summary.dart';
import 'package:personal_expense_manager/data/models/transaction.dart' as transaction;
import 'package:personal_expense_manager/data/providers/transaction_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    TransactionProvider transactionProvider = TransactionProvider();
    String Currency = "\$";

    return FutureBuilder<List<transaction.Transaction>>(
      future: transactionProvider.FetchAllOrderedByDateTimeDesc(),
      builder: (BuildContext context,AsyncSnapshot<List<transaction.Transaction>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for data
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle any errors that occur during the fetch
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        List<transaction.Transaction> transactions = snapshot.data!;
        double totalIncome = 0;
        double totalExpense = 0;
        for (transaction.Transaction trans in transactions) {
          if (trans.isExpense) {
            totalExpense += trans.amount;
          } else {
            totalIncome += trans.amount;
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
    );
  }
}
