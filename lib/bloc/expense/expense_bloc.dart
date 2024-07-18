import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitial()) {
    on<addExpenseEvent>((event, emit) {
      print(event);
      print(state.expenseValue);
      emit(ExpenseState(expenseValue: state.expenseValue + event.price));
      print(state.expenseValue);
    });
  }
}
