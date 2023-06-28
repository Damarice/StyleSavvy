import 'package:flutter/material.dart';

import 'FashionAppMenu.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String category = args?['category'] ?? '';

    // Mock data for available earphones
    List<Earphone> earphones = [
      Earphone(
        name: 'Earphone Model 1',
        price: 1200,
        currency: 'Ksh.',
      ),
      Earphone(
        name: 'Earphone Model 2',
        price: 1500,
        currency: 'Ksh.',
      ),
      Earphone(
        name: 'Earphone Model 3',
        price: 1800,
        currency: 'Ksh.',
      ),
      Earphone(
        name: 'Earphone Model 4',
        price: 2000,
        currency: 'Ksh.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Category: $category'),
      ),
      body: ListView.builder(
        itemCount: earphones.length,
        itemBuilder: (context, index) {
          final earphone = earphones[index];
          return ListTile(
            title: Text(earphone.name),
            subtitle: Text('${earphone.currency} ${earphone.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    // Perform an action when the user taps the star icon
                  },
                  icon: Icon(Icons.star),
                ),
                IconButton(
                  onPressed: () {
                    // Perform an action when the user taps the review icon
                  },
                  icon: Icon(Icons.rate_review),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Earphone {
  final String name;
  final double price;
  final String currency;

  Earphone({
    required this.name,
    required this.price,
    required this.currency,
  });
}


  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String category = args?['category'] ?? '';

    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'Category: $category',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }