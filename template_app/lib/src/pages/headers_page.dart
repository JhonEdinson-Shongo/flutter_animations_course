import 'package:flutter/material.dart';
import 'package:template_app/src/themes/app_theme.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Headers', style: TextStyle(color: AppTheme.white)),
      ),
      body: const Center(
        child: Text('Headers'),
      ),
    );
  }
}