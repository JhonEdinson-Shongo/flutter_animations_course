import 'package:flutter/material.dart';

class HomePage
 extends StatelessWidget {
  const HomePage
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Headers Custonpainter'),
              trailing: const  Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.format_shapes_outlined),
              onTap: () => Navigator.pushNamed(context, 'HeadersPage'),
            ),
            ListTile(
              title: const Text('Animations'),
              trailing: const  Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.animation_outlined),
              onTap: () => Navigator.pushNamed(context, 'AnimationsPage'),
            ),
            ListTile(
              title: const Text('Custom Progress'),
              trailing: const  Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.refresh_rounded),
              onTap: () => Navigator.pushNamed(context, 'CustomProgressPage'),
            ),
            ListTile(
              title: const Text('SlideShow'),
              trailing: const  Icon(Icons.arrow_forward_ios),
              leading: const Icon(Icons.slideshow),
              onTap: () => Navigator.pushNamed(context, 'SlideShowPage'),
            ),
          ],
        )
      )
    );
  }
} 