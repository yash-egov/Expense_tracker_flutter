part of 'items_bloc.dart';

@immutable
class ItemsState extends Equatable {
  final List<Item> allitems;
  const ItemsState({required this.allitems});
  @override
  List<Object> get props => [];
}

final class ItemsInitial extends ItemsState {
  ItemsInitial() : super(allitems: []);
}
