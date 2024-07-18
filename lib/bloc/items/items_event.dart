part of 'items_bloc.dart';

@immutable
class ItemsEvent {}

class addItemEvent extends ItemsEvent {
  final Item curr;
  addItemEvent(this.curr) : super();
}

class removeItemEvent extends ItemsEvent {
  final int index;
  removeItemEvent(this.index) : super();
}

class filterItemsEvent extends ItemsEvent {
  final List<Item> newitems;
  filterItemsEvent(this.newitems) : super();
}
