import 'package:flutter/material.dart';
import 'ingredients.dart';


class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  String selected = 'Sugar';
  final TextEditingController amountController = TextEditingController();
  String result = '';

  void convert() {
    double? amount = double.tryParse(amountController.text);
    if (amount == null) {
      setState(() {
        result = 'Enter a number';
      });
      return;
    }
    double gramsPerCup = ingredients[selected]![0];
    double kcalPer100 = ingredients[selected]![1];
    double grams = amount * gramsPerCup;
    double kcal = grams / 100 * kcalPer100;
    setState(() {
      result = '${grams.toStringAsFixed(0)} g | about ${kcal.toStringAsFixed(0)} kcal';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Convert')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selected,
              isExpanded: true,
              items: ingredients.keys.map((name) => DropdownMenuItem(value: name, child: Text(name))).toList(),
              onChanged: (value) {
                setState(() {
                  selected = value!;
                });
              },
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount (cups)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: convert, child: const Text('Convert')),
            const SizedBox(height: 16),
            Text(result, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}