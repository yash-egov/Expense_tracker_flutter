part of 'expense_bloc.dart';

@immutable
class ExpenseState extends Equatable {
  final double expenseValue;
  const ExpenseState({required this.expenseValue});
  @override
  List<Object> get props => [expenseValue];
}

final class ExpenseInitial extends ExpenseState {
  const ExpenseInitial() : super(expenseValue: 0);
}
