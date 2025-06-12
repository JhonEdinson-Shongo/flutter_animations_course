import 'package:designs_1/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Headers'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeaderRounded(),
            SizedBox(height: 40),
            HeaderDiagonal(),
            SizedBox(height: 40),
            HeaderRowDown(),
            SizedBox(height: 40),
            HeaderCurvo(),
            SizedBox(height: 40),
            HeaderWave(),
            SizedBox(height: 40),
            HeaderWaveGradient(),
            SizedBox(height: 1000),
          ],
        ),
      ),
    );
  }
}