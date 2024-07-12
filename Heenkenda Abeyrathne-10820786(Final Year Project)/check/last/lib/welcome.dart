// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors


import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:last/login.dart';
import 'package:last/signup.dart';


// ignore: camel_case_types
class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'img/lo.png',
                height: deviceHeight * 0.2,
              ),
              // SizedBox(height: deviceHeight * 0.1),
              Image.asset(
                'img/welcome.png',
                height: deviceHeight * 0.3,
              ),
              SizedBox(height: 2),
              Text(
                'Feel better, sleep better with guided meditation, soothing music and soothing activities...',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 27, 6, 91),
                    fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 2),
              Text(
                'Share Your Pain and Thoughts with Others',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 27, 6, 91),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(
                  context, 
                 MaterialPageRoute(builder: (context) => signup()),
                 );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(255, 27, 6, 91),),
                  fixedSize: MaterialStateProperty.all(
                      Size(deviceWidth * 0.5, double.infinity,)),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}