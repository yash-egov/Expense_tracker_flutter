import 'package:expense_tracker/bloc/balance/balance_bloc.dart';
import 'package:expense_tracker/bloc/expense/expense_bloc.dart';
import 'package:expense_tracker/bloc/items/items_bloc.dart';
import 'package:expense_tracker/home.dart';
import 'package:expense_tracker/Me/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BalanceBloc(),
        ),
        BlocProvider(
          create: (context) => ItemsBloc(),
        ),
        BlocProvider(
          create: (context) => ExpenseBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
