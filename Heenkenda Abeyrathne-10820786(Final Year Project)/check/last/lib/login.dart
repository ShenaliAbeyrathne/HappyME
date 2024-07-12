// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last/homepage.dart';
import 'package:last/signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


// ignore: camel_case_types, use_key_in_widget_constructors
class login extends StatefulWidget {
  @override
  _loginstate createState() => _loginstate();
}

// ignore: camel_case_types
class _loginstate extends State {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
Future<void> _loginUser() async {
    // ignore: prefer_const_declarations
    final String apiUrl = 'http://localhost:3000/login'; // Replace with your actual backend URL

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );
   
    if (response.statusCode == 200) {
      // Login successful, handle the response accordingly (e.g., navigate to another screen)
      print('Login successful');
    } else {
      // Login failed, show an error message
      print('Login failed');
    }
  }
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
    
              Image.asset( 'img/log.png',
                height: deviceHeight * 0.4,
              ),
              // ignore: duplicate_ignore
              // ignore: prefer_const_constructors
              
              // ignore: duplicate_ignore
              // ignore: prefer_const_constructors
              Text(
                'SIGN IN',
                textAlign: TextAlign.center,
                style: GoogleFonts.abyssinicaSil(
                    fontSize: 37,
                    color: Color.fromARGB(255, 27, 6, 91),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
             
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => homepage()),
                  );
                  _loginUser;
                  // Here you can implement your login logic
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  // For now, just print the values
                  print('Username: $username');
                  print('Password: $password');
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color.fromARGB(255, 27, 6, 91),),
                  fixedSize: MaterialStateProperty.all(
                      Size(deviceWidth * 0.4, double.infinity,)),
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:16,
                  ),
                  
                ),
              ),
               Text(
                'Don\'t have an account?',
                textAlign: TextAlign.center,

                style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
               
             TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup()),
                  );
                },
                child: Text(
                  'Sign up here',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 57, 33, 214),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), 
            ],
          )
         ),
            
          ),
        );
    
  }
}