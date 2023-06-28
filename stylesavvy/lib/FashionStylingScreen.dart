import 'package:flutter/material.dart';

import 'BookNowScreen.dart';
class FashionStylingScreen extends StatefulWidget {
  @override
  _FashionStylingScreenState createState() => _FashionStylingScreenState();
}

class _FashionStylingScreenState extends State<FashionStylingScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'category': 'Official',
      'subcategories': [],
      'image': 'assets/images/official.png',
      'description': 'Explore official fashion styles',
    },
    {
      'category': 'Casual',
      'subcategories': [],
      'image': 'assets/images/casual.png',
      'description': 'Discover casual fashion styles',
    },
    {
      'category': 'Evening Dinner',
      'subcategories': [],
      'image': 'assets/images/evening_dinner.png',
      'description': 'Get inspired by evening dinner fashion styles',
    },
    {
      'category': 'Wedding',
      'subcategories': [],
      'image': 'assets/images/wedding.png',
      'description': 'Find elegant wedding fashion styles',
    },
    {
      'category': 'Baby Shower',
      'subcategories': [],
      'image': 'assets/images/baby_shower.png',
      'description': 'Celebrate with stylish baby shower fashion',
    },
    {
      'category': 'Graduation',
      'subcategories': [],
      'image': 'assets/images/graduation.png',
      'description': 'Dress up for graduation day',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion App'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // TODO: Implement menu functionality
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fashion Styling',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Image.asset(
                          categories[index]['image'],
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8),
                        Text(
                          categories[index]['category'],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          categories[index]['description'],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/book-now');
                          },
                          child: Text('Book Now'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Stylesavvy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FashionStylingScreen(),
        '/book-now': (context) => BookNowScreen(),
      },
    );
  }
}