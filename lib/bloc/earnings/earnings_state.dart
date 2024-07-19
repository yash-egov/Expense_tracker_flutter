part of 'earnings_bloc.dart';

class EarningsState extends Equatable {
  final double earning;
  const EarningsState(this.earning);

  @override
  List<Object> get props => [earning];
}

final class EarningsInitial extends EarningsState {
  EarningsInitial() : super(0);
}
