import 'package:flutter/material.dart';
import 'convert.dart';
import 'scale.dart';
import 'oven.dart';

void main(){
 runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maqader',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5EA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Maqader',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC4521A),
              ),
            ),
            const SizedBox(height: 42),
            ElevatedButton(
              onPressed: () {
                Navigator.push( context, MaterialPageRoute( builder : (context) => const ConvertPage()),

                );
              },
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push( context, MaterialPageRoute( builder : (context) => const ConvertPage()),

                );
              },
              child: const Text('Scale Recipe'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push( context, MaterialPageRoute( builder : (context) => const ConvertPage()),
                );
                    },
              child: const Text('Oven Temp'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

