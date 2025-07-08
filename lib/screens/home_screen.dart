
import 'package:flutter/material.dart';
import 'result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onScanPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nutrition Scanner')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _onScanPressed(context),
          child: const Text('Scan Barcode'),
        ),
      ),
    );
  }
}
