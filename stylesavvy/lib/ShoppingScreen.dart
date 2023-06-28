import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingScreen(),
    );
  }
}

class ShoppingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce Shop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryTile(category: 'Earphones'),
            ProductGrid(
              products: [
                Product(
                  productImage: 'assets/earphones_1.jpg',
                  productName: 'Earphones 1',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 1500,
                ),
                Product(
                  productImage: 'assets/earphones_2.jpg',
                  productName: 'Earphones 2',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 2000,
                ),
                Product(
                  productImage: 'assets/earphones_3.jpg',
                  productName: 'Earphones 3',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 2500,
                ),
                Product(
                  productImage: 'assets/earphones_4.jpg',
                  productName: 'Earphones 4',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 1800,
                ),
              ],
            ),
            CategoryTile(category: 'AirPods'),
            ProductGrid(
              products: [
                Product(
                  productImage: 'assets/airpods_1.jpg',
                  productName: 'AirPods 1',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 5000,
                ),
                Product(
                  productImage: 'assets/airpods_2.jpg',
                  productName: 'AirPods 2',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 7000,
                ),
                Product(
                  productImage: 'assets/airpods_3.jpg',
                  productName: 'AirPods 3',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 6000,
                ),
                Product(
                  productImage: 'assets/airpods_4.jpg',
                  productName: 'AirPods 4',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 5500,
                ),
              ],
            ),
            CategoryTile(category: 'Headphones'),
            ProductGrid(
              products: [
                Product(
                  productImage: 'assets/headphones_1.jpg',
                  productName: 'Headphones 1',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 3000,
                ),
                Product(
                  productImage: 'assets/headphones_2.jpg',
                  productName: 'Headphones 2',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 4000,
                ),
                Product(
                  productImage: 'assets/headphones_3.jpg',
                  productName: 'Headphones 3',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 3500,
                ),
                Product(
                  productImage: 'assets/headphones_4.jpg',
                  productName: 'Headphones 4',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 3800,
                ),
              ],
            ),
            CategoryTile(category: 'Headbands'),
            ProductGrid(
              products: [
                Product(
                  productImage: 'assets/headbands_1.jpg',
                  productName: 'Headbands 1',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 1000,
                ),
                Product(
                  productImage: 'assets/headbands_2.jpg',
                  productName: 'Headbands 2',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 1200,
                ),
                Product(
                  productImage: 'assets/headbands_3.jpg',
                  productName: 'Headbands 3',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 1100,
                ),
                Product(
                  productImage: 'assets/headbands_4.jpg',
                  productName: 'Headbands 4',
                  productDescription: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  productPrice: 900,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String category;

  const CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[100],
      padding: EdgeInsets.all(16.0),
      child: Text(
        category,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    final int gridItemCount = 4;
    final int rowCount = (products.length / gridItemCount).ceil();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridItemCount,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final Product product = products[index];
        return ProductTile(
          product: product,
        );
      },
    );
  }
}

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image.asset(product.productImage),
          SizedBox(height: 8.0),
          Text(
            product.productName,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            product.productDescription,
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 8.0),
          Text(
            'PRICE: KSH ${product.productPrice}',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String productImage;
  final String productName;
  final String productDescription;
  final int productPrice;

  const Product({
    required this.productImage,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  });
}
