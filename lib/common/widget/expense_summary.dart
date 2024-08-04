import 'package:flutter/material.dart';

class ExpenseSummary extends StatefulWidget {
  double totalIncome = 0;
  double totalExpense = 0;
  ExpenseSummary(
      {Key? key, required this.totalIncome, required this.totalExpense})
      : super(key: key);

  @override
  State<ExpenseSummary> createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
  @override
  Widget build(BuildContext context) {
    double savings = widget.totalIncome - widget.totalExpense;
    String Currency = "\$";

    return Column(
      children: [
        Expanded(
          flex:1,
          child: Text(
            "Total Balance",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Currency + savings.toString(),
            style: TextStyle(
              color: savings < 0 ? Colors.red : Colors.green,
              fontSize: 30,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Expanded(
                    flex:1,
                    child: Text(
                      "Income ",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Text(
                      Currency + widget.totalIncome.toString(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    flex:1,
                    child: Text(
                      "Expense ",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Text(
                      Currency + widget.totalExpense.toString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
