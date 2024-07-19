class Item {
  String? _itemName;
  double? _itemPrice;
  DateTime createdTime = DateTime.now();
  Item(this._itemName, this._itemPrice);

  String getItemName() {
    return _itemName!;
  }

  double getItemPrice() {
    return _itemPrice!;
  }

  String getCreatedTime() {
    String date = '${createdTime.day}-${createdTime.month}-${createdTime.year}';
    return date;
  }
}
