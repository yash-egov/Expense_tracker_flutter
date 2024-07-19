// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expense_tracker/forms/FormScreen.dart';
import 'package:expense_tracker/bloc/balance/balance_bloc.dart';
import 'package:expense_tracker/bloc/earnings/earnings_bloc.dart';
import 'package:expense_tracker/bloc/expense/expense_bloc.dart';
import 'package:expense_tracker/bloc/items/items_bloc.dart';
import 'package:expense_tracker/custom_card.dart';
import 'package:expense_tracker/forms/earning_form.dart';
import 'package:expense_tracker/model/Item.dart';
import 'package:expense_tracker/Me/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentYear = DateTime.now().year;
  List<Item> allItems = [];

  String? convert(int? x) {
    switch (x) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return null;
    }
  }

  DateTime selectedDate = DateTime.now();
  int _selectedIndex = 0;
  double totalExpenses = 0.0;
  double totalIncome = 0.0;
  String searchValue = "";
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  void deleteItem(int index) {
    print("Delete called");
    print(allItems);

    setState(() {
      allItems.removeAt(index);
    });
    print(allItems);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsBloc, ItemsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Container(
              width: 100,
              child: TextField(
                controller: _searchController,
                style: const TextStyle(color: Color.fromARGB(255, 2, 13, 128)),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Color.fromARGB(136, 0, 0, 0)),
                  // border: InputBorder.none,
                ),
                onChanged: (value) {
                  // Perform search functionality here
                  print('all items : ${state.allitems}');
                  print(value);
                  List<Item> newItems = [];
                  for (int i = 0; i < state.allitems.length; i++) {
                    if (state.allitems[i]
                        .getItemName()
                        .toLowerCase()
                        .contains(value)) {
                      newItems.add(state.allitems[i]);
                    }
                  }
                  print(newItems);
                  context.read<ItemsBloc>().add(filterItemsEvent(newItems));
                },
              ),
            ),
            title: Text("Yash"),
            backgroundColor: Colors.amber,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text("Comming Soon......"),
                      duration: Duration(milliseconds: 50),
                    );

                    // Show the SnackBar using ScaffoldMessenger
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: Icon(Icons.calendar_month_outlined))
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                color: Colors.amber,
                height: 58.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('$currentYear'),
                        TextButton(
                          onPressed: () {},
                          child: Text('${convert(DateTime.now().month)} '),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '|',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Expenses'),
                        BlocBuilder<ExpenseBloc, ExpenseState>(
                          builder: (context, state) {
                            return Text('${state.expenseValue}');
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EarningForm()),
                          );
                        }, child: BlocBuilder<EarningsBloc, EarningsState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                Text('Earnings'),
                                Text('${state.earning}'),
                              ],
                            );
                          },
                        ))
                      ],
                    ),
                    Column(
                      children: [
                        Text('Balance'),
                        BlocBuilder<EarningsBloc, EarningsState>(
                          builder: (context, state1) {
                            return BlocBuilder<BalanceBloc, BalanceState>(
                              builder: (context, state) {
                                return Text(
                                    '${state1.earning - state.balanceValue}');
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<ItemsBloc, ItemsState>(
            builder: (context, state) {
              return Center(
                child: state.filteredItems.isEmpty
                    ? Text('No names found')
                    : ListView.builder(
                        itemCount: state.filteredItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${state.filteredItems[index].getItemName()}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${state.filteredItems[index].getItemPrice()}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500),
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Icon(Icons.edit)),
                                ElevatedButton(
                                    onPressed: () => {
                                          context.read<ExpenseBloc>().add(
                                              addExpenseEvent(-state
                                                  .filteredItems[index]
                                                  .getItemPrice()!)),
                                          context.read<BalanceBloc>().add(
                                              UpdateBalanceEvent(-state
                                                  .filteredItems[index]
                                                  .getItemPrice()!)),
                                          context
                                              .read<ItemsBloc>()
                                              .add(removeItemEvent(index!)),
                                          deleteItem(index)
                                        },
                                    child: Icon(Icons.delete)),
                              ],
                            ),
                          );
                        },
                      ),
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber, // Change this color
            unselectedItemColor: Colors.grey,

            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  label: 'Records',
                  icon: IconButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text("Comming Soon......"),
                        duration: Duration(milliseconds: 50),
                      );

                      // Show the SnackBar using ScaffoldMessenger
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      _onItemTapped(0);
                    },
                    icon: Icon(Icons.receipt_rounded),
                  )),
              BottomNavigationBarItem(
                label: 'Charts',
                icon: IconButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text("Comming Soon......"),
                      duration: Duration(milliseconds: 50),
                    );

                    // Show the SnackBar using ScaffoldMessenger
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: Icon(Icons.analytics),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Add',
                icon: IconButton(
                    onPressed: () async {
                      _onItemTapped(2);
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FormScreen()),
                      );

                      if (result != null) {
                        setState(() {
                          allItems.addAll(result);
                        });
                      }
                    },
                    icon: Icon(Icons.add)),
              ),
              BottomNavigationBarItem(
                label: 'Reports',
                icon: IconButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text("Comming Soon......"),
                        duration: Duration(milliseconds: 50),
                      );

                      // Show the SnackBar using ScaffoldMessenger
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: Icon(Icons.file_copy)),
              ),
              BottomNavigationBarItem(
                label: 'Me',
                icon: IconButton(
                    onPressed: () async {
                      _onItemTapped(4);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    icon: Icon(Icons.contact_page)),
              ),
            ],
          ),
        );
      },
    );
  }
}
