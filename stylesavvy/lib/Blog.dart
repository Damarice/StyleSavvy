import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: ListView(
        children: [
          BlogPost(
            title: 'Blog Post 1',
            author: 'John Doe',
            date: 'June 1, 2023',
            content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          ),
          BlogPost(
            title: 'Blog Post 2',
            author: 'Jane Smith',
            date: 'June 5, 2023',
            content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem.',
          ),
        ],
      ),
    );
  }
}

class BlogPost extends StatelessWidget {
  final String title;
  final String author;
  final String date;
  final String content;

  const BlogPost({
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'By $author - $date',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }
}
