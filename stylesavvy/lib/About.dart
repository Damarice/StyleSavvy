import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Center(
        child: Text(
          'Welcome to our Fashion App! We are dedicated to providing the latest fashion trends and styling tips to our users.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
