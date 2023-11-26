import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                "Type",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Description",
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Text(
                "&&",
                style: TextStyle(color: Colors.red, fontSize: 20),
              )
            ],
          ),
          Row(
            children: [
              Text("DateTime"),
            ],
          )
        ],
      ),
    );
  }
}
