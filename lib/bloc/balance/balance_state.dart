part of 'balance_bloc.dart';

@immutable
class BalanceState extends Equatable {
  final double balanceValue;
  const BalanceState({required this.balanceValue});

  @override
  List<Object> get props => [balanceValue];
}

final class BalanceInitial extends BalanceState {
  const BalanceInitial() : super(balanceValue: 0);
}
