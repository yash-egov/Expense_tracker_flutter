part of 'balance_bloc.dart';

sealed class BalanceEvent {
  final double price;
  const BalanceEvent(this.price);
}

class UpdateBalanceEvent extends BalanceEvent {
  const UpdateBalanceEvent(val) : super(val);
}
