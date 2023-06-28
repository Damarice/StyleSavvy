import 'package:flutter/material.dart';

import 'FashionAppMenu.dart';
class BlogPage extends StatelessWidget {
  // Sample blog post data
  final List<BlogPost> blogPosts = [
    BlogPost(
      title: 'First Blog Post',
      author: 'John Doe',
      date: 'June 1, 2023',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam malesuada lorem ut est lacinia, a tempus ligula dignissim. Nam non odio ut odio tincidunt tincidunt non eu tortor.',
    ),
    BlogPost(
      title: 'Second Blog Post',
      author: 'Jane Smith',
      date: 'June 5, 2023',
      content: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    ),
    BlogPost(
      title: 'Third Blog Post',
      author: 'Alex Johnson',
      date: 'June 10, 2023',
      content: 'Fusce et hendrerit turpis, in vestibulum est. Mauris aliquam facilisis tortor, vel sollicitudin sapien ultrices sed. Sed luctus risus non volutpat fermentum.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FashionAppMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Blog',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: blogPosts.length,
                itemBuilder: (context, index) {
                  final blogPost = blogPosts[index];
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                blogPost.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'By ${blogPost.author} - ${blogPost.date}',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                blogPost.content,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogPost {
  final String title;
  final String author;
  final String date;
  final String content;

  BlogPost({
    required this.title,
    required this.author,
    required this.date,
    required this.content,
  });
}