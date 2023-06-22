import 'package:flutter/material.dart';

class BookNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Now'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle book now button pressed
            // Add your logic to navigate to the booking form or perform any other action
          },
          child: Text('Book Now'),
        ),
      ),
    );
  }
}
