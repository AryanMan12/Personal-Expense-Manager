import 'package:flutter/material.dart';

import 'package:personal_expense_manager/common/widget/expense_card.dart';
import 'package:personal_expense_manager/common/widget/expense_summary.dart';
import 'package:personal_expense_manager/data/models/transaction.dart';
import 'package:personal_expense_manager/data/services/injection_container.dart';
import 'package:personal_expense_manager/data/providers/interface/itransaction_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ITransactionProvider transactionProvider = locator<ITransactionProvider>();
    // String currency = "₹";

    return FutureBuilder<List<Transaction>>(
        future: transactionProvider.fetchAllOrderedByDateTimeDesc(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for data
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle any errors that occur during the fetch
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          List<Transaction> transactions = snapshot.data!;
          double totalIncome = 0;
          double totalExpense = 0;
          for (Transaction trans in transactions) {
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
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        // Shadow for top-left corner
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(10, 10),
                          blurRadius: 6,
                          spreadRadius: 1,
                        ),
                        // Shadow for bottom-right corner
                        BoxShadow(
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
              const Expanded(
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
        });
  }
}
