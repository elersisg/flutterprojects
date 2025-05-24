import 'package:flutter/material.dart';

import '../expenses.dart';
import '../models/expense.dart';
import 'expense_card.dart';

class ExpensesList extends StatelessWidget {
   ExpensesList({super.key, required this.expenses, required this.onRemove});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index].id),
            onDismissed: (direction) {
            //Remover el elemento de la lista
              onRemove(expenses[index]);
            },
            child: ExpenseCard(expense: expenses[index],),);
      },
    );
  }
}