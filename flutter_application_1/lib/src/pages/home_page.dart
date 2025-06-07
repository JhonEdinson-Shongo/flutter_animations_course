import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/themes/app_theme.dart';

class HomePage
 extends StatelessWidget {
  const HomePage
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: AppTheme.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
                title: const Text('Headers'),
                trailing: const  Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, 'HeadersPage'),
              ),
          ],
        )
      )
    );
  }
} 