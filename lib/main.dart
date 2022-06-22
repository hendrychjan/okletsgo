import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ok lets goo!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text(
                  "Lets go",
                  style: TextStyle(fontSize: 40),
                ),
                onPressed: () async {
                  AudioPlayer player = AudioPlayer();
                  Source s = AssetSource("mem.mp3");
                  if (!_isPlaying) {
                    player.play(s);
                    setState(() {
                      _isPlaying = true;
                    });
                  }
                  player.dispose();
                  setState(() {
                    _isPlaying = false;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: const Text(
                  "Lets go (nahlas)",
                  style: TextStyle(fontSize: 40),
                ),
                onPressed: () async {
                  AudioPlayer player = AudioPlayer();
                  Source s = AssetSource("mem_loud.mp3");
                  if (!_isPlaying) {
                    player.play(s);
                    setState(() {
                      _isPlaying = true;
                    });
                  }
                  player.dispose();
                  setState(() {
                    _isPlaying = false;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
