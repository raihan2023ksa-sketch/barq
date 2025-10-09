import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BarqApp());
}

class BarqApp extends StatelessWidget {
  const BarqApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageCycleScreen(),
    );
  }
}

class ImageCycleScreen extends StatefulWidget {
  const ImageCycleScreen({Key? key}) : super(key: key);

  @override
  State<ImageCycleScreen> createState() => _ImageCycleScreenState();
}

class _ImageCycleScreenState extends State<ImageCycleScreen> {
  int _index = 0;
  final List<String> _images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  Future<void> _handleTap() async {
    setState(() {
      _index++;
    });

    if (_index >= _images.length) {
      final uri = Uri(scheme: 'mailto', path: '');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open mail app')),
          );
        }
      }
      setState(() {
        _index = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _handleTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            _images[_index],
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
