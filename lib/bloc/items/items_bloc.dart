import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_tracker/model/Item.dart';
import 'package:meta/meta.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(ItemsInitial()) {
    on<addItemEvent>((event, emit) {
      print("Insite Bloc addItemEvent");
      print(event.curr!.getItemName());
      state.allitems.add(event.curr!);
      print(state.allitems);
      emit(ItemsState(allitems: state.allitems));
    });

    on<removeItemEvent>((event, emit) {
      print("Insite Bloc removeItemEvent");

      state.allitems.removeAt(event.index);
      print(state.allitems);
      emit(ItemsState(allitems: state.allitems));
    });
  }
}
