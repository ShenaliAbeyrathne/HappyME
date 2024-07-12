// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:last/friends.dart';
import 'package:last/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  final String content;

  Post({required this.content});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      content: json['content'],
    );
  }
}

// ignore: camel_case_types, use_key_in_widget_constructors
class wall extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _wallstate createState() => _wallstate();
}

// ignore: camel_case_types
class _wallstate extends State<wall> {
   List<Post> posts = [];
   Future<void> getAllPosts() async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:3000/getAllPosts'), // Replace with your backend API endpoint
      );
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
         print('Fetched data: $data');
        setState(() {
          posts = data.map((item) => Post.fromJson(item)).toList();
        });
      } else {
        print('Error fetching posts: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching posts: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    getAllPosts(); // Fetch posts when the widget is initialized
  } // List to store posts
  // ignore: prefer_final_fields, unused_field
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showCommentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: 'Type your comment here'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                // Add code here to handle posting the comment
                await _postComment(_textEditingController.text);
                // Show the posted comments in a new dialog or widget
              _showPostedComments(context);
              },
              child: Text('Post'),
            ),
          ],
        );
      },
    );
  }
  Future<void> _postComment(String comment) async {
   try {
      // Replace the endpoint with your backend API endpoint for posting comments
      final response = await http.post(
        Uri.parse('http://localhost:3000/getAllCommentsForPost'), // Replace with your backend API endpoint
        body: jsonEncode({
          'postId': 'postId_here', // Replace postId_here with the actual post ID
          'content': comment,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        print('Comment posted successfully');
      } else {
        print('Error posting comment: ${response.statusCode}');
      }
    } catch (error){
      print('Error posting comments: $error');
    }
}

void _showPostedComments(BuildContext context) {
  // Fetch and display the posted comments here
  // You can use another AlertDialog or a separate widget for this purpose
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Posted Comments'),
        content: Container(
          // Add your widget to display posted comments here
          // For example, you can use a ListView.builder to show a list of comments
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the posted comments dialog
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}
   // Index of the selected item in the bottom navigation bar
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double deviceHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: duplicate_ignore
            // ignore: prefer_const_constructors
            SizedBox(height: 7),
            Text(
              'Your Community ',
              style: GoogleFonts.alegreyaSans(
                fontSize: 35
                ,
                color: Color.fromARGB(255, 59, 25, 160),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            
             SizedBox(height: 7),
          Text(
              'Join Others',
              style: GoogleFonts.almarai
              (
                fontSize: 22,
                color: Color.fromARGB(255, 29, 189, 45),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:40),
            Text(
              'Your Feed',
              style: GoogleFonts.alegreyaSans
              (
                fontSize: 24,
                color: Color.fromARGB(255, 2, 2, 2),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
           SizedBox(height: 35), // Adjust the spacing as needed
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0),
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 238, 244),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 125, 121, 121).withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Post $index',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          posts[index].content,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                         Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _showCommentDialog(context);
                              },
                              icon: Icon(Icons.comment),
                            ),
                            SizedBox(width: 140),
                            TextButton(
                              onPressed: () {
                                // Handle comments button press
                              },
                              child: Text('Comments'),
                            ),
                          ],
                        ),
                      ],
                    ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: Color.fromARGB(255, 61, 56, 193),
  items: <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                  );
          // Handle tap for the Home button
        },
        child: Icon(Icons.home),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => friends()),
                  );
          // Handle tap for the Chat button
        },
        child: Icon(Icons.chat),
      ),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => wall()),
                  );
          // Handle tap for the Community button
        },
        child: Icon(Icons.group),
      ),
      label: 'Community',
    ),
    BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          // Handle tap for the Profile button
        },
        child: Icon(Icons.account_circle),
      ),
      label: 'Profile',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: Color.fromARGB(255, 255, 255, 255),
  onTap: _onItemTapped,
),
    );
  }
}
