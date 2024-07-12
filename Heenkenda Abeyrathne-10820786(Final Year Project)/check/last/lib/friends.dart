// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/chat.dart';


// ignore: camel_case_types, use_key_in_widget_constructors
class friends extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _friendsstate createState() => _friendsstate();
}

// ignore: camel_case_types
class _friendsstate extends State<friends> {
  
  List<dynamic> _users = []; // List to store fetched users
  bool _isLoading = true;
  
   @override
  void initState() {
    super.initState();
    _fetchUsers(); // Fetch users when the page is initialized
  } 
   Future<void> _fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/registration'));
      if (response.statusCode == 200) {
        setState(() {
          _users = jsonDecode(response.body);
          _isLoading = false; // Set loading indicator to false when data is fetched
        });
      } else {
        // Handle errors if needed
        print('Error fetching users: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors
      print('Error fetching users: $error');
    }
  }
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } // Index of the selected item in the bottom navigation bar
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
              'Share With Friends ',
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
              'Talk With Friends',
              style: GoogleFonts.almarai
              (
                fontSize: 22,
                color: Color.fromARGB(255, 29, 189, 45),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:40), Expanded(
              child: ListView.separated(
                itemCount: 30, // Number of users, adjust as needed
                separatorBuilder: (context, index) => Divider(
                  color: Colors.black, // Black line between users
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('URL_to_user_image_$index'),
                    ),
                    title: Text(
                      'User Name $index'
                      ),
                    trailing: IconButton(
                      icon: Icon(Icons.message), // Message icon button
                      onPressed: () {
                         Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => chat()),
                  );
                        // Handle message button press
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensure all icons are visible
        backgroundColor: Color.fromARGB(255, 69, 36, 188),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
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
