import 'package:flutter/material.dart';
import 'package:personal_expense_manager/common/widget/expense_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
              ExpenseCard(),
            ],
          ),
        )
      ],
    );
  }
}
