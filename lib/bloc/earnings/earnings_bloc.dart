import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'earnings_event.dart';
part 'earnings_state.dart';

class EarningsBloc extends Bloc<EarningsEvent, EarningsState> {
  EarningsBloc() : super(EarningsInitial()) {
    on<EarningsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<addEarningEvent>((event, emit) {
      // emit(addEarningEvent(event.earning));
      print("Inside add Earnings Event");
      print(event.earning);
      emit(EarningsState(event.earning));
    });
  }
}
