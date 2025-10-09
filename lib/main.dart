import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const SimpleImageApp());
}

class SimpleImageApp extends StatefulWidget {
  const SimpleImageApp({Key? key}) : super(key: key);

  @override
  State<SimpleImageApp> createState() => _SimpleImageAppState();
}

class _SimpleImageAppState extends State<SimpleImageApp> {
  int _currentIndex = 0;

  final List<String> _images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  void _handleTap() async {
    setState(() {
      _currentIndex++;
    });

    if (_currentIndex >= _images.length) {
      final Uri gmailUri = Uri(
        scheme: 'mailto',
        path: '',
      );
      // try to open mail app (Gmail on many devices)
      if (await canLaunchUrl(gmailUri)) {
        await launchUrl(gmailUri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open email app')),
          );
        }
      }

      // reset to first image
      setState(() {
        _currentIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barq',
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _handleTap,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Image.asset(
              _images[_currentIndex],
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}