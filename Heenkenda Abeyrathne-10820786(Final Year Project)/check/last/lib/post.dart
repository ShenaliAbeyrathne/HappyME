// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:last/friends.dart';
import 'package:last/homepage.dart';
import 'package:last/wall.dart';


// ignore: camel_case_types, use_key_in_widget_constructors
class post extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _poststate createState() => _poststate();
}

// ignore: camel_case_types
class _poststate extends State<post> {
  // ignore: prefer_final_fields
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } // Index of the selected item in the bottom navigation bar
  void createPost(String content) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/createPost'),
      body: jsonEncode({'content': content}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      print('Post created successfully');
    } else {
      print('Error creating post: ${response.body}');
    }
  } catch (error) {
    print('Error creating post: $error');
  }
}
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
              'Online Community ',
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
              'Share Your Thoughts Here',
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
              'Description',
              style: GoogleFonts.alegreyaSans
              (
                fontSize: 24,
                color: Color.fromARGB(255, 2, 2, 2),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
           SizedBox(height: 35), // Adjust the spacing as needed
            Container(
              width: double.infinity, // Takes full width of the screen
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _textEditingController,
                maxLines: 8, // Allow up to 3 lines of text
                maxLength: 150, // Limit to 100 characters
                decoration: InputDecoration(
                  hintText: 'Write your thoughts here (up to 150 words)',
                  border: InputBorder.none,
                ),
              ),
            ),
             
           SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => friends()),
                 );
                  createPost(_textEditingController.text);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 29, 189, 45),),
                  fixedSize: MaterialStateProperty.all(
                      Size(deviceWidth * 0.5, double.infinity,)),
                ),
                child: Text(
                  'Share With Friends',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  
                ),
              ),
               SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => wall()),
                 );
                  
                  createPost(_textEditingController.text);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 59, 25, 160),),
                  fixedSize: MaterialStateProperty.all(
                      Size(deviceWidth * 0.5, double.infinity,)),
                ),
                child: Text(
                  'Post',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  
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
