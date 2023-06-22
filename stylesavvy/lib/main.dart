import 'package:flutter/material.dart';

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
      home: HomePage(),
      routes: {
        '/fashion-styling': (context) => FashionStylingScreen(),
        '/shop': (context) => ShoppingScreen(),
        '/category': (context) => CategoryScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion App'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fashion-styling');
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              ),
              child: Text('Fashion Styling'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shop');
              },
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              ),
              child: Text('Shop'),
            ),
          ],
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
  List<String> selectedItems = [];

  void selectItem(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Styling'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(
          9,
          (index) {
            final itemName = 'Item ${index + 1}';
            final isSelected = selectedItems.contains(itemName);
            return InkWell(
              onTap: () => selectItem(itemName),
              child: Card(
                color: isSelected ? Colors.grey : null,
                child: Center(
                  child: Text(
                    itemName,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Categories'),
              subtitle: Text('Fashion Styling'),
            ),
            ListTile(
              title: Text('Official'),
              onTap: () {
                Navigator.pushNamed(context, '/category', arguments: 'Official');
              },
            ),
            ListTile(
              title: Text('Casual'),
              onTap: () {
                Navigator.pushNamed(context, '/category', arguments: 'Casual');
              },
            ),
            ListTile(
              title: Text('Evening Dinner'),
              onTap: () {
                Navigator.pushNamed(context, '/category', arguments: 'Evening Dinner');
              },
            ),
            ExpansionTile(
              title: Text('Events'),
              children: [
                ListTile(
                  title: Text('Wedding'),
                  onTap: () {
                    Navigator.pushNamed(context, '/category', arguments: 'Wedding');
                  },
                ),
                ListTile(
                  title: Text('Baby Shower'),
                  onTap: () {
                    Navigator.pushNamed(context, '/category', arguments: 'Baby Shower');
                  },
                ),
                ListTile(
                  title: Text('Graduation'),
                  onTap: () {
                    Navigator.pushNamed(context, '/category', arguments: 'Graduation');
                  },
                ),
              ],
            ),
          ],
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
      appBar: AppBar(
        title: Text(selectedCategory),
      ),
      body: ListView.builder(
        itemCount: 6, // Replace with the actual number of items for the selected category
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
              title: Text('Headphones'),
              onTap: () {
                selectCategory('Headphones');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Airpods'),
              onTap: () {
                selectCategory('Airpods');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Headbands'),
              onTap: () {
                selectCategory('Headbands');
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
    final String category = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of products for the category
        itemBuilder: (context, index) {
          final productName = 'Product ${index + 1}';
          return ListTile(
            title: Text(productName),
            subtitle: Text('Price: \$9.99'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Add to cart functionality
              },
            ),
          );
        },
      ),
    );
  }
}
