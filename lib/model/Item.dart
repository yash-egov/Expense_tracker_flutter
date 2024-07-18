class Item {
  String? _itemName;
  double? _itemPrice;
  Item(this._itemName, this._itemPrice);

  String getItemName() {
    return _itemName!;
  }

  double getItemPrice() {
    return _itemPrice!;
  }
}
