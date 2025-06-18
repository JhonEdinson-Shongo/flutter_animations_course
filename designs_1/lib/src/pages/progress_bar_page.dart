import 'dart:math';

import 'package:designs_1/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomProgressPage extends StatefulWidget {
  const CustomProgressPage({super.key});

  @override
  State<CustomProgressPage> createState() => _CustomProgressPageState();
}

class _CustomProgressPageState extends State<CustomProgressPage> {

  double progress = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Circular Progress por defecto',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20.0),
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox(height: 20.0),
            Text('Circular Progress custom',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20.0),
            Container(
              width: 300.0,
              height: 300.0,
              color: AppTheme.black.withOpacity(0.03),
              child: CustomPaint(
                painter: _CustomRadialProgress(progress, strokeWidth: 10.0),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.arrow_circle_up_sharp),
            onPressed: () {
              setState(() {
                progress += 0.1;
                if (progress > 1.0) {
                  progress = 0.1;
                }
              });
            },
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            child: const Icon(Icons.restart_alt),
            onPressed: () {
              setState(() {
                progress = 0.0;
              });
            },
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            child: const Icon(Icons.arrow_circle_down_sharp),
            onPressed: () {
              setState(() {
                progress -= 0.1;
                if (progress < 0.0) {
                  progress = 0.0;
                }
              });
            },
          ),
        ]),
    );
  }
}

class _CustomRadialProgress extends CustomPainter {
  final double progress;
  final double strokeWidth;

  _CustomRadialProgress(this.progress, {this.strokeWidth = 10.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth / 2;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(
      size.width * 0.5 - strokeWidth / 2,
      size.height * 0.5 - strokeWidth / 2,
    );

    canvas.drawCircle(center, radius, paint);

    double arcAngle = 2 * pi * progress;

    final paintArc = Paint()
      ..color = AppTheme.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
