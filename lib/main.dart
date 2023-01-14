// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PianoApp());
}

class PianoApp extends StatefulWidget {
  const PianoApp({super.key});

  @override
  State<PianoApp> createState() => _PianoAppState();
}

class _PianoAppState extends State<PianoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'simple Piano',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            PianoKey("key01.mp3", "D"),
            PianoKey("key02.mp3", "R"),
            PianoKey("key03.mp3", "M"),
            PianoKey("key04.mp3", "F"),
            PianoKey("key05.mp3", "S"),
          ],
        ),
      ),
    );
  }
}

class PianoKey extends StatefulWidget {
  final note;
  final keyName;
  const PianoKey(this.note, this.keyName, {super.key});

  @override
  State<PianoKey> createState() => _PianoKeyState();
}

class _PianoKeyState extends State<PianoKey> {
  late Color _keyColor;
  final player = AudioPlayer();
  late String _keyName;

  @override
  void initState() {
    _keyName = widget.keyName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _keyColor = Colors.white;
    return Center(
        child: GestureDetector(
      onTap: () {
        setState(() {
          _keyColor = Colors.greenAccent;
          player.play(AssetSource(widget.note));
        });
      },
      child: Container(
        height: 100,
        width: 50,
        decoration: BoxDecoration(
          color: _keyColor,
        ),
        child: Center(
          child: Text(
            _keyName,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    ));
  }
}
