import 'package:flutter/material.dart';
import 'package:personal_expense_manager/screen/home_screen.dart';
import 'package:personal_expense_manager/util/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expense Manager',
      themeMode: ThemeMode.light,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expense Manager"),
        ),
        body: HomeScreen(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "List"),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label:"dashboard"),
          ],
        ),
        floatingActionButton: FloatingActionButton(child: Text("+"),onPressed: ()=>{},),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
