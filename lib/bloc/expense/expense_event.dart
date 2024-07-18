part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {
  final double price;
  const ExpenseEvent(this.price);
}

class addExpenseEvent extends ExpenseEvent {
  const addExpenseEvent(val) : super(val);
}
