import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FashionAppMenu.dart';
class BookNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Book Now',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Available Dates and Times:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            // Display the list of available dates and times here

            SizedBox(height: 20),
            Text(
              'Pricing Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            // Display the pricing information here

            SizedBox(height: 20),
            Text(
              'Personal Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            // Add form fields for clients to submit their personal information here

            SizedBox(height: 20),
            Text(
              'Payment Method:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            // Add form fields for clients to submit their payment method here

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchLiveChat,
              child: Text('Live Chat'),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchLiveChat() async {
  const liveChatUrl = 'https://your-live-chat-url.com'; // Replace with your live chat URL

  if (await canLaunch(liveChatUrl)) {
    await launch(liveChatUrl);
  } else {
    throw 'Could not launch live chat URL';
  }
}