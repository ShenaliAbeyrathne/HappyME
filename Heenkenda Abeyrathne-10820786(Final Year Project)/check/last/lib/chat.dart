// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, camel_case_types, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:socket_io_client/socket_io_client.dart' as IO;

// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';

// ignore: use_key_in_widget_constructors
class chat extends StatefulWidget {
  
  @override
  // ignore: library_private_types_in_public_api
  _chatstate createState() => _chatstate();
}

class _chatstate extends State<chat> {
  TextEditingController _textEditingController = TextEditingController();
  int _selectedIndex = 0;
  // ignore: unused_field
  List<String> _messages = [];
  List<String> sentMessages = [];
  List<String> receivedMessages = [];
 // List to store messages

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
void _sendMessage(String message) {
    setState(() {
      sentMessages.insert(0, message); // Insert at the beginning for new to old sorting
    });
  }

  // ignore: unused_element
  void _receiveMessage(String message) {
    setState(() {
      receivedMessages.insert(0, message); // Insert at the beginning for new to old sorting
    });
  } 
   void _deleteMessage(int index) {
    setState(() {
      sentMessages.removeAt(index);
    });
  }

  void _copyMessage(int index) {
    Clipboard.setData(ClipboardData(text: sentMessages[index]));
  } 
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double deviceHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70, // Adjust the height of the stripe as needed
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7), // Black color with opacity
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0), // Round bottom left corner
                bottomRight: Radius.circular(15.0), // Round bottom right corner
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundImage: AssetImage('path_to_profile_image'),
                    radius: 20, // Adjust the radius of the profile photo
                  ),
                  SizedBox(width: 30),
                  Text(
                    'User Name', // Replace with actual user's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        Expanded(
            child: ListView.builder(
              reverse: true, // Start from the bottom
              itemCount: sentMessages.length + receivedMessages.length,
              itemBuilder: (context, index) {
                if (index < sentMessages.length) {
                  // Sent message
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Options'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _deleteMessage(index);
                                },
                                child: Text('Delete'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _copyMessage(index);
                                },
                                child: Text('Copy'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(sentMessages[index], style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  );
                } else {
                  // Received message
                  int receivedIndex = index - sentMessages.length;
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(receivedMessages[receivedIndex], style: TextStyle(color: Colors.white)),
                    ),
                  );
                }
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  String message = _textEditingController.text.trim();
                  if (message.isNotEmpty) {
                    _sendMessage(message);
                    _textEditingController.clear();
                  }
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 69, 36, 188),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
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
