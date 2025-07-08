
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Map<String, dynamic>? productData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final data = await ApiService.fetchProductData('737628064502'); // Sample barcode
    setState(() {
      productData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Info')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : productData == null
              ? const Center(child: Text('Product not found'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${productData!['product_name'] ?? 'N/A'}',
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text('Nutri-Score: ${productData!['nutriscore_grade'] ?? 'N/A'}'),
                      const SizedBox(height: 10),
                      Text('Calories: ${productData!['nutriments']?['energy-kcal_100g'] ?? 'N/A'} kcal/100g'),
                    ],
                  ),
                ),
    );
  }
}
