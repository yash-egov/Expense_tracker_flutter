import 'package:expense_tracker/bloc/balance/balance_bloc.dart';
import 'package:expense_tracker/bloc/expense/expense_bloc.dart';
import 'package:expense_tracker/bloc/items/items_bloc.dart';
import 'package:expense_tracker/model/Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _itemName;
  double? _itemPrice;

  List<Item> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Item Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemName = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Item Price'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _itemPrice = double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Item curr = new Item(_itemName, _itemPrice);
                    data.add(curr);
                    context.read<ItemsBloc>().add(addItemEvent(curr));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data ${data.length}')),
                    );
                  }
                  context.read<ExpenseBloc>().add(addExpenseEvent(_itemPrice));
                  context
                      .read<BalanceBloc>()
                      .add(UpdateBalanceEvent(_itemPrice));

                  Navigator.pop(context, data);
                },
                child: Text('Submit'),
              ),
              SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context, data);
              //   },
              //   child: Text('Submit All items'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
