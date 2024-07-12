// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:last/friends.dart';
import 'package:last/homepage.dart';
import 'package:last/wall.dart';

class meditation extends StatefulWidget {
  @override
  _meditationState createState() => _meditationState();
}

class _meditationState extends State<meditation> {
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
              'Meditation ',
              style: GoogleFonts.alegreyaSans(
                fontSize: 35,
                color: Color.fromARGB(255, 59, 25, 160),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 7),
            Text(
              'Calm Your Mind',
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
                child: Image.asset('img/meditation1.png'),
              ),
              title: Text('Mantron'),
              subtitle: Text('Meditation'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/MANTRON.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Mantron', 'img/meditation1.png'); // Pass track name and cover image path
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
                child: Image.asset('img/meditation2.png'),
              ),
              title: Text('Freezing but Warm'),
              subtitle: Text('Meditation'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/Freezing.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Freezing but Warm', 'img/meditation2.png'); // Pass track name and cover image path
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
                child: Image.asset('img/meditation3.png'),
              ),
              title: Text('Dhaka'),
              subtitle: Text('Meditation'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/Dhaka.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Dhaka', 'img/meditation3.png'); // Pass track name and cover image path
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
                child: Image.asset('img/meditation4.png'),
              ),
              title: Text('Melody Of Nature'),
              subtitle: Text('Meditation'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/melody.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Melody Of Nature', 'img/meditation4.png'); // Pass track name and cover image path
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
                child: Image.asset('img/meditation5.png'),
              ),
              title: Text('Hymn To The Dawn'),
              subtitle: Text('Meditation'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/HymnToTheDawn.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Hymn To The Dawn', 'img/meditation5.png'); // Pass track name and cover image path
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
                child: Image.asset('img/meditation6.png'),
              ),
              title: Text('Etheral Healing'),
              subtitle: Text('Meditation'),
              trailing: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () async {
                  var assetSource = AssetSource('audio/beloved.mp3');
                  await _player.play(assetSource);
                  _showMusicControls(context, 'Etheral Healing', 'img/meditation6.png'); // Pass track name and cover image path
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
