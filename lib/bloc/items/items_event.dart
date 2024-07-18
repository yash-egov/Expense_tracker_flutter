part of 'items_bloc.dart';

@immutable
class ItemsEvent {}

class addItemEvent extends ItemsEvent {
  final Item curr;
  addItemEvent(this.curr) : super();
}

class removeItemEvent extends ItemsEvent {
  int index;
  removeItemEvent(this.index) : super();
}
