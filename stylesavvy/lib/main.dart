import 'package:flutter/material.dart';
import 'dart:async';

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

class FashionAppMenu extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Fashion App',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            'About',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            'Contact',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/blog');
          },
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            'Blog',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/book-now');
          },
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            'Book Now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/signup');
          },
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            'Signup',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imagePaths = [
    'assets/Background.jpeg',
    'assets/Background1.jpeg',
    'assets/Background2.jpeg',
  ];
  int currentIndex = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Start the slideshow timer
    startSlideshow();
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer?.cancel();
    super.dispose();
  }

  void startSlideshow() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentIndex < imagePaths.length - 1) {
        setState(() {
          currentIndex++;
        });
      } else {
        setState(() {
          currentIndex = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
          ),
          PageView.builder(
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return Container(
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fashion-styling');
                  },
                  child: Text(
                    'Fashion Style',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 10,
                  color: Colors.transparent,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/shop');
                  },
                  child: Text(
                    'Shop',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imagePaths.length, (index) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index ? Colors.white : Colors.grey,
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '  Copyright @2023; Designed by mywebbworks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'Contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class FashionStylingScreen extends StatefulWidget {
  @override
  _FashionStylingScreenState createState() => _FashionStylingScreenState();
}

class _FashionStylingScreenState extends State<FashionStylingScreen> {
  final List<Map<String, dynamic>> categories = [
    {
      'category': 'Official',
      'subcategories': [],
    },
    {
      'category': 'Casual',
      'subcategories': [],
    },
    {
      'category': 'Evening Dinner',
      'subcategories': [],
    },
    {
      'category': 'Events',
      'subcategories': ['Wedding', 'Baby Shower', 'Graduation'],
    },
  ];

  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    _isExpandedList = List<bool>.filled(categories.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index]['category'];
                final subcategories = categories[index]['subcategories'];

                return ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      _isExpandedList[index] = !isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(
                            category,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                      body: Column(
                        children: List.generate(subcategories.length, (subIndex) {
                          final subcategory = subcategories[subIndex];

                          return ListTile(
                            title: Text(subcategory),
                            onTap: () {
                              Navigator.pushNamed(context, '/category',
                                  arguments: {'category': subcategory});
                            },
                          );
                        }),
                      ),
                      isExpanded: _isExpandedList[index],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/category', arguments: {'category': 'Earphones'});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Earphones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/category', arguments: {'category': 'Headphones'});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Headphones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/category', arguments: {'category': 'Airpods'});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Airpods',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/category', arguments: {'category': 'Head Bands'});
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Head Bands',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



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

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'Blog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class BookNowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'Book Now',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'Signup',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
