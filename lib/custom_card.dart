import 'package:expense_tracker/bloc/balance/balance_bloc.dart';
import 'package:expense_tracker/bloc/expense/expense_bloc.dart';
import 'package:expense_tracker/bloc/items/items_bloc.dart';
import 'package:expense_tracker/model/Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCard extends StatelessWidget {
  String? _name;
  double? _price;
  int? index;
  var deleteItem;
  MyCard(this._name, this._price, this.deleteItem, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${_name}',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Text(
            '${_price}',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          ElevatedButton(onPressed: () {}, child: Icon(Icons.edit)),
          ElevatedButton(
              onPressed: () => {
                    context.read<ExpenseBloc>().add(addExpenseEvent(-_price!)),
                    context
                        .read<BalanceBloc>()
                        .add(UpdateBalanceEvent(-_price!)),
                    context.read<ItemsBloc>().add(removeItemEvent(index!)),
                    deleteItem(index)
                  },
              child: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
