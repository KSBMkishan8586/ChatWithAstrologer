import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AstroCallScreen extends StatefulWidget {
  const AstroCallScreen({Key? key}) : super(key: key);

  @override
  State<AstroCallScreen> createState() => _AstroCallScreenState();
}

class _AstroCallScreenState extends State<AstroCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('astro call screen'),
      ),
    );
  }
}
