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
            Navigator.pushNamed(context, '/contact');
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
          'This is the About Us page.',
          style: TextStyle(fontSize: 20),
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
          'This is the Contact page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class FashionStylingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'This is the Fashion Styling screen.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class ShoppingScreen extends StatefulWidget {
  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  String selectedCategory = 'Shop';

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          final itemName = 'Item ${index + 1}';
          return Card(
            child: ListTile(
              leading: Icon(Icons.shopping_bag),
              title: Text(itemName),
              subtitle: Text('Price: \$9.99'),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Add to cart functionality
                },
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Categories'),
              subtitle: Text(selectedCategory),
            ),
            ListTile(
              title: Text('Shop'),
              onTap: () {
                selectCategory('Shop');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Earphones'),
              onTap: () {
                selectCategory('Earphones');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Watches'),
              onTap: () {
                selectCategory('Watches');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Clothing'),
              onTap: () {
                selectCategory('Clothing');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Shoes'),
              onTap: () {
                selectCategory('Shoes');
                Navigator.pop(context);
              },
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
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'This is the Category screen.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Text(
          'This is the Blog page.',
          style: TextStyle(fontSize: 20),
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
          'This is the Book Now page.',
          style: TextStyle(fontSize: 20),
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
          'This is the Signup page.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
