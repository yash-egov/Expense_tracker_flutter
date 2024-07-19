import 'package:expense_tracker/bloc/earnings/earnings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EarningForm extends StatefulWidget {
  const EarningForm({super.key});

  @override
  State<EarningForm> createState() => _EarningFormState();
}

class _EarningFormState extends State<EarningForm> {
  final _formKey = GlobalKey<FormState>();
  double? earnings = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EarningsBloc, EarningsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Earnings'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Earnings'),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter valid Earnings';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      earnings = double.parse(value!);
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        context
                            .read<EarningsBloc>()
                            .add(addEarningEvent(earnings!));
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text('Processing Data ${data.length}')),
                        // );
                      }

                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
