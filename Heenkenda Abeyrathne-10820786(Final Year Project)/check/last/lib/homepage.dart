// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:last/friends.dart';
import 'package:last/meditation.dart';
import 'package:last/music.dart';
import 'package:last/pro.dart';
import 'package:last/wall.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class homepage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _homepagestate createState() => _homepagestate();
}

// ignore: camel_case_types
class _homepagestate extends State {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double deviceHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
      child :Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ignore: duplicate_ignore
            // ignore: prefer_const_constructors
            SizedBox(height: 7),
            Text(
              'Welcome To ',
              style: GoogleFonts.alegreyaSans(
                fontSize: 35
                ,
                color: Color.fromARGB(255, 59, 25, 160),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              'Happy Me !!! ',
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
              'Your Safe Space for Support and Self-Care',
              style: GoogleFonts.almarai
              (
                fontSize: 22,
                color: Color.fromARGB(255, 29, 189, 45),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:10),
          Text(
              'Join Online Community Here',
              style: GoogleFonts.actor
              (
                fontSize: 18,
                color: Color.fromARGB(255, 59, 25, 160),
                fontStyle: FontStyle.normal,
                 ),
            ),
            SizedBox(height:10),
             Material(
  elevation: 5,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  ),
  color: Colors.transparent,
  child: GestureDetector(
    onTap: () {
      Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => wall()),
                 );
      // Handle button tap here, e.g., navigate to another screen
    },
              child: Container(
                width: 150,
                height: 150,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('img/Community1.png'),
              ),
              ),
            ),
             ),
             SizedBox(height:10),
          Text(
              'Select your Options',
              style: GoogleFonts.actor
              (
                fontSize: 18,
                color: Color.fromARGB(255, 59, 25, 160),
                fontStyle: FontStyle.normal,
                 ),
            ),
            SizedBox(height: 20),
            Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => MusicScreen()),
                 );
        // Handle button tap for the first image
      },
      child: Container(
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset('img/music.png'),
        ),
      ),
    ),
    SizedBox(width: 20),
    GestureDetector(
      onTap: () {
        Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => meditation()),
                 );
        // Handle button tap for the second image
      },
      child: Container(
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset('img/meditation.png'),
        ),
      ),
    ),
  ],
),

        SizedBox(height: 20),
           Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    GestureDetector(
      onTap: () {
        Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => pro()),
                 );
        // Handle button tap for the first image
      },
      child: Container(
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset('img/mhcp.png'),
        ),
      ),
    ),
    SizedBox(width: 20),
    GestureDetector(
      onTap: () {
        Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => friends()),
                 );
        // Handle button tap for the second image
      },
      child: Container(
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset('img/chat.png'),
        ),
      ),
    ),
  ],
),

        ],
        ),
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
