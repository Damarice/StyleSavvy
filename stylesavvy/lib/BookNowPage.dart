import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'FashionAppMenu.dart';

class BookNowPage extends StatefulWidget {
  @override
  _BookNowPageState createState() => _BookNowPageState();
}

class _BookNowPageState extends State<BookNowPage> {
  DateTime? selectedDate;
  String name = '';
  String phoneNumber = '';
  String email = '';
  String? fashionStyle;
  String? paymentMethod;
  String message = '';

  final List<String> paymentMethods = ['Mpesa', 'Bank'];
  final List<String> fashionStyles = [
    'Official',
    'Casual',
    'Evening Dinner',
    'Wedding',
    'Baby Shower',
    'Graduation'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Book Now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
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
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text('Select Date and Time'),
              ),
              if (selectedDate != null)
                Text('Selected date: $selectedDate'),
              SizedBox(height: 20),
              Text(
                'Personal Information:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: fashionStyle,
                onChanged: (newValue) {
                  setState(() {
                    fashionStyle = newValue;
                  });
                },
                items: fashionStyles.map((style) {
                  return DropdownMenuItem(
                    value: style,
                    child: Text(style),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Select your fashion style',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Payment Method:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: paymentMethod,
                onChanged: (newValue) {
                  setState(() {
                    paymentMethod = newValue;
                  });
                },
                items: paymentMethods.map((method) {
                  return DropdownMenuItem(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                decoration: InputDecoration(
                  hintText: 'Select payment method',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    message = value;
                  });
                },
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Enter your message',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitBooking,
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _launchLiveChat,
                child: Text('Live Chat'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _submitBooking() {
    // Perform the booking submission logic here
    print('Selected date: $selectedDate');
    print('Name: $name');
    print('Phone number: $phoneNumber');
    print('Email: $email');
    print('Fashion style: $fashionStyle');
    print('Payment method: $paymentMethod');
    print('Message: $message');
  }

  void _launchLiveChat() async {
    const liveChatUrl = 'https://your-live-chat-url.com'; // Replace with your live chat URL

    if (await canLaunch(liveChatUrl)) {
      await launch(liveChatUrl);
    } else {
      throw 'Could not launch live chat URL';
    }
  }
}
