import 'dart:math';

import 'package:expensetracker/main.dart';
import 'package:flutter/cupertino.dart';

import 'components/new_expense.dart';
import 'models/expense.dart';
import 'package:flutter/material.dart';

import 'components/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {


  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Pago Universidad',
      amount: 10.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cine',
      amount: 15.59,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewExpense(onAdExpense: _addNewExpense,);
      },
    );
  }

  void _addNewExpense (Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });

            }),
        content: Center(child: Text("Expense deleted"),),),);
  }

  @override
  Widget build(BuildContext context) {
    
    Widget mainContent = Center(
      child: Text("You don't have any expenses. Start adding something "),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemove: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: Icon(Icons.add, size: 40),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent
          ),

        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Text('Settings'),
            ),
            CircleAvatar(
              radius: 60,
            ),
            CupertinoSwitch(
                value: true,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  } else {
                    setState(() {
                      kDarkColorScheme  = value as ColorScheme;
                    });
                  }
                },
            ),
            Spacer(),
            ListTile(
              title: Text('Salir'),
              onTap: () {
                Navigator.pop(context);
              }
            ),

          ],
        ),
      ),
    );
  }
}




