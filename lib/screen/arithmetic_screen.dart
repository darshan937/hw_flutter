import 'package:flutter/material.dart';
import 'package:hw_flutter/enum/arithmetic_enum.dart';
import 'package:hw_flutter/model/arithmetic_screen_model.dart';

class ArithmeticScreen extends StatefulWidget {
  const ArithmeticScreen({super.key});

  @override
  State<ArithmeticScreen> createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Arithmetic instance
  ArithmeticModel? arithmeticModel;

  // Arithmetic Enum
  ArithmeticEnum? _operation = ArithmeticEnum.add;

  // Variables
  double? first;
  double? second;
  double result = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: const Text('Arithmetic'),
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(9),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first number.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    first = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'First Number'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter second number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    second = double.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Second Number'),
                ),
                const SizedBox(height: 8),
                ListTile(
                  title: const Text('Add'),
                  leading: Radio<ArithmeticEnum>(
                    value: ArithmeticEnum.add,
                    groupValue: _operation,
                    onChanged: (ArithmeticEnum? value) {
                      setState(() {
                        _operation = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Subtract'),
                  leading: Radio<ArithmeticEnum>(
                    value: ArithmeticEnum.subtract,
                    groupValue: _operation,
                    onChanged: (ArithmeticEnum? value) {
                      setState(() {
                        _operation = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Multiply'),
                  leading: Radio<ArithmeticEnum>(
                    value: ArithmeticEnum.multiply,
                    groupValue: _operation,
                    onChanged: (ArithmeticEnum? value) {
                      setState(() {
                        _operation = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Divide'),
                  leading: Radio<ArithmeticEnum>(
                    value: ArithmeticEnum.divide,
                    groupValue: _operation,
                    onChanged: (ArithmeticEnum? value) {
                      setState(() {
                        _operation = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      setState(() {
                        arithmeticModel = ArithmeticModel(
                            firstNumber: first!, secondNumber: second!);
                        result = arithmeticModel!.calculate(_operation!);
                      });
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Display information
                Text(
                  'Result : $result',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
