import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/app_logo_fiill.png',
      fit: BoxFit.cover,
    );
  }
}

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/app_logo_fiill.png',
      fit: BoxFit.cover,
      color: Colors.red, // Apply a red tint for error images
      colorBlendMode: BlendMode.color,
    );
  }
}