part of 'earnings_bloc.dart';

class EarningsEvent {
  const EarningsEvent();
}

class addEarningEvent extends EarningsEvent {
  double earning;
  addEarningEvent(this.earning) : super();
}
