import 'package:flutter/material.dart';

class ExpenseSummary extends StatefulWidget {
  int totalIncome = 0;
  int totalExpense = 0;
  ExpenseSummary({Key? key, required this.totalIncome, required this.totalExpense}):super(key:key);

  @override
  State<ExpenseSummary> createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
  @override
  Widget build(BuildContext context) {
    int savings = widget.totalIncome - widget.totalExpense;

    return Container(
      height: 100,
      child: Column(
        children: [
          Text("Overall Savings: "+savings.toString(),style: TextStyle(
            color: savings < 0? Colors.red: Colors.green,
            fontSize: 20,
          )),
          Row(
            children: [
              Text("Income: "+widget.totalIncome.toString(),style: TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),),
              Text("Expense: "+widget.totalExpense.toString(),style: TextStyle(
    color: Colors.red,
    fontSize: 20,
    ),)
            ],
          )
        ],
      ),
    );
  }
}
