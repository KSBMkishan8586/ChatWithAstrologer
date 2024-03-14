import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AstroChatScreen extends StatefulWidget {
  const AstroChatScreen({super.key});

  @override
  State<AstroChatScreen> createState() => _AstroChatScreenState();
}

class _AstroChatScreenState extends State<AstroChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('chat Astro Screen'),
      ),
    );
  }
}
