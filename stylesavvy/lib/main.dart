import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'AboutUsPage.dart';
import 'BlogPage.dart';
import 'BookNowPage.dart';
import 'CategoryScreen.dart';
import 'ContactPage.dart';
import 'FashionStylingScreen.dart';
import 'HomePage.dart';
import 'ShoppingScreen.dart';
import 'SignupPage.dart';



void main() {
  runApp(FashionApp());
}

class FashionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        hintColor: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutUsPage(),
        '/contact': (context) => ContactPage(),
        '/fashion-styling': (context) => FashionStylingScreen(),
        '/shop': (context) => ShoppingScreen(),
        '/category': (context) => CategoryScreen(),
        '/blog': (context) => BlogPage(),
        '/book-now': (context) => BookNowPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
