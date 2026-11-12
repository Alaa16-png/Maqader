import 'package:flutter/material.dart';

class ScalePage extends StatefulWidget {
  const ScalePage({super.key});

  @override
  State<ScalePage> createState() => _ScalePageState();
}

class _ScalePageState extends State<ScalePage> {
  final TextEditingController originalController = TextEditingController();
  final TextEditingController newController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String result = '';

  void scale() {
    double? original = double.tryParse(originalController.text);
    double? newS = double.tryParse(newController.text);
    double? amount = double.tryParse(amountController.text);

    if (original == null || newS == null || amount == null || original == 0) {
      setState(() {
        result = 'Enter valid numbers';
      });
    } else {
      double newAmount = amount * newS / original;

      setState(() {
        result = 'New Amount: ${newAmount.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: originalController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Original servings',
              ),
            ),
            TextField(
              controller: newController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'New servings',
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: scale,
              child: const Text('Scale'),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}