// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:last/friends.dart';
import 'package:last/homepage.dart';
import 'package:last/wall.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  AudioPlayer _player = AudioPlayer();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 7),
            Text(
              'Soothing Music ',
              style: GoogleFonts.alegreyaSans(
                fontSize: 35,
                color: Color.fromARGB(255, 59, 25, 160),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Relax Your Mind',
              style: GoogleFonts.almarai(
                fontSize: 22,
                color: Color.fromARGB(255, 29, 189, 45),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/chill.jpeg'),
              ),
              title: Text('Chill'),
              subtitle: Text('Calming'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/chill.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Chill', 'img/chill.jpeg'); // Pass track name and cover image path
                },
              ),
            ),
              Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/chill1.png'),
              ),
              title: Text('Moonlight'),
              subtitle: Text('Soothing'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/moonlight.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Moonlight', 'img/chill1.png'); // Pass track name and cover image path
                },
              ),
            ),
             Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/music3.png'),
              ),
              title: Text('Reverie'),
              subtitle: Text('Soothing'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/reverie.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Reverie', 'img/music3.png'); // Pass track name and cover image path
                },
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/music4.png'),
              ),
              title: Text('Nature'),
              subtitle: Text('Soothing'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/nature.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Nature', 'img/music4.png'); // Pass track name and cover image path
                },
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/music5.png'),
              ),
              title: Text('Memories'),
              subtitle: Text('Soothing'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/memories.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Memories', 'img/music5.png'); // Pass track name and cover image path
                },
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/music6.png'),
              ),
              title: Text('Beloved'),
              subtitle: Text('Soothing'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/beloved.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Beloved', 'img/music6.png'); // Pass track name and cover image path
                },
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),

            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/music7.png'),
              ),
              title: Text('Cheer Up'),
              subtitle: Text('Positivity'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/cheer.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Cheer Up', 'img/music7.png'); // Pass track name and cover image path
                },
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
             ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.asset('img/music7.png'),
              ),
              title: Text('Cheer Up'),
              subtitle: Text('Positivity'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/cheer.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Cheer Up', 'img/music7.png'); // Pass track name and cover image path
                },
              ),
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

  void _showMusicControls(BuildContext context, String trackName, String coverImagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.black.withOpacity(0.8),
          child: Container(
            height: 120,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(coverImagePath), // Replace with actual cover image path
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      trackName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            _player.resume(); // Play audio
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.pause),
                          onPressed: () {
                            _player.pause(); // Pause audio
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            _player.stop(); // Stop audio
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
