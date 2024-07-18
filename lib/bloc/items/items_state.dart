part of 'items_bloc.dart';

@immutable
class ItemsState extends Equatable {
  final List<Item> allitems, filteredItems;
  const ItemsState(this.allitems, this.filteredItems);
  @override
  List<Object> get props => [allitems, filteredItems];
}

final class ItemsInitial extends ItemsState {
  ItemsInitial() : super([], []);
}
