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
      emit(ItemsState(state.allitems, state.allitems));
    });

    on<removeItemEvent>((event, emit) {
      print("Insite Bloc removeItemEvent");

      state.allitems.removeAt(event.index);
      print(state.allitems);
      emit(ItemsState(state.allitems, state.allitems));
    });

    on<filterItemsEvent>((event, emit) {
      print("Inside filter event");
      // state.allitems.removeWhere(test)
      print(state.allitems.length);
      print(event.newitems.length);
      emit(ItemsState(state.allitems, event.newitems));
    });
  }
}
