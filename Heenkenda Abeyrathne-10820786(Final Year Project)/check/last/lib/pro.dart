// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:last/friends.dart';
import 'package:last/homepage.dart';
import 'package:last/wall.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class pro extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _prostate createState() => _prostate();
}

// ignore: camel_case_types
class _prostate extends State<pro> {
  // ignore: prefer_final_fields, unused_field
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } // Index of the selected item in the bottom navigation bar

  List<Doctor> doctors = [
    Doctor(
      name: 'Dr. John Doe',
      specialty: 'Counsellor',
      email: 'johndoe@example.com',
      phoneNumber: '+1 123-456-7890',
      photoUrl: 'https://via.placeholder.com/150', // Placeholder URL
    ),
    Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Counsellor',
      email: 'janesmith@example.com',
      phoneNumber: '+1 987-654-3210',
      photoUrl: 'https://via.placeholder.com/150', // Placeholder URL
    ),
     Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Counsellor',
      email: 'janesmith@example.com',
      phoneNumber: '+1 987-654-3210',
      photoUrl: 'https://via.placeholder.com/150', // Placeholder URL
    ),
     Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Counsellor',
      email: 'janesmith@example.com',
      phoneNumber: '+1 987-654-3210',
      photoUrl: 'https://via.placeholder.com/150', // Placeholder URL
    ),
     Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Counsellor',
      email: 'janesmith@example.com',
      phoneNumber: '+1 987-654-3210',
      photoUrl: 'https://via.placeholder.com/150', // Placeholder URL
    ),
     Doctor(
      name: 'Dr. Jane Smith',
      specialty: 'Counsellor',
      email: 'janesmith@example.com',
      phoneNumber: '+1 987-654-3210',
      photoUrl: 'https://via.placeholder.com/150', // Placeholder URL
    ),
    // Add more doctors as needed
  ];

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
              'Professional Support ',
              style: GoogleFonts.alegreyaSans(
                fontSize: 35,
                color: Color.fromARGB(255, 59, 25, 160),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 7),
            Text(
              'Contact Professionals',
              style: GoogleFonts.almarai(
                fontSize: 22,
                color: Color.fromARGB(255, 29, 189, 45),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                itemCount: doctors.length, // Number of doctors
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.black,
                    height: 2,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  Doctor doctor = doctors[index];
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(doctor.photoUrl),
                    ),
                    title: Text(doctor.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Specialty: ${doctor.specialty}'),
                        Text('Email: ${doctor.email}'),
                        Text('Phone: ${doctor.phoneNumber}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        // Add more details functionality
                      },
                    ),
                    onTap: () {
                      // Add onTap functionality for doctor
                    },
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

class Doctor {
  final String name;
  final String specialty;
  final String email;
  final String phoneNumber;
  final String photoUrl;

  Doctor({
    required this.name,
    required this.specialty,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
  });
}


