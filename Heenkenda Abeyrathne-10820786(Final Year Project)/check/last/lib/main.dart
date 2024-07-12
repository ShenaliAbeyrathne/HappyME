// ignore: unused_import
// ignore_for_file: prefer_const_constructors

// ignore: unused_import

// ignore: unused_import
import 'package:last/chat.dart';
// ignore: unused_import
import 'package:last/friends.dart';
// ignore: unused_import
import 'package:last/login.dart';
// ignore: unused_import
import 'package:last/meditation.dart';
// ignore: unused_import
import 'package:last/music.dart';
// ignore: unused_import
import 'package:last/pro.dart';
// ignore: unused_import
import 'package:last/signup.dart';

// ignore: unused_import
import 'package:last/welcome.dart';
// ignore: unused_import
import 'package:last/homepage.dart';
// ignore: unused_import
import 'package:last/post.dart';
// ignore: unused_import
import 'package:last/wall.dart';
// ignore: unused_import

import 'package:flutter/material.dart';

// ignore: unused_import




void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // ignore: duplicate_ignore
        // ignore: prefer_const_constructors
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 27, 6, 91)),
        useMaterial3: true,
      ),
      home:signup(),);
      }
}
