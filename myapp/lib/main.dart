import 'dart:convert';
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  Future<void> _fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Post> fetchedPosts = data.map((post) => Post.fromJson(post)).toList();
      setState(() {
        posts = fetchedPosts;
      });
    } else {
      // Handle error
      print('Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Press the button to fetch posts:',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _fetchPosts();
              },
              child: Text('Fetch Posts'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index].title),
                    subtitle: Text(posts[index].body),
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

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
