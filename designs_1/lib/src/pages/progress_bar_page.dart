import 'dart:math';

import 'package:designs_1/src/themes/app_theme.dart';
import 'package:designs_1/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CustomProgressPage extends StatefulWidget {
  const CustomProgressPage({super.key});

  @override
  State<CustomProgressPage> createState() => _CustomProgressPageState();
}

class _CustomProgressPageState extends State<CustomProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationProgress;
  double progress = 0.0;
  double tempProgress = 0.0;
  double increment = 0.1;
  bool isLoading = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animationProgress = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOutBack,
      ),
    );

    _controller?.addListener(() {
      setState(() {
        isLoading = true;
        progress = tempProgress + (_animationProgress!.value * increment);
      });
    });

    _controller?.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          isLoading = false;
          increment = 0.1;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
                width: 200.0,
                height: 200.0,
                color: AppTheme.black.withOpacity(0.03),
                child: CustomPaint(
                  painter: _CustomRadialProgress(progress, strokeWidth: 10.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Text('Circular Progress custom',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20.0),
              RadialProgress(progress: progress),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.arrow_circle_up_sharp),
            onPressed: () {
              if (isLoading) return;
              setState(() {
                tempProgress = progress;
                if (tempProgress >= 1.0) {
                  tempProgress = 0.0;
                  progress = 0.0;
                }
                _controller?.forward(from: 0.0);
              });
            },
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            child: const Icon(Icons.restart_alt),
            onPressed: () {
              if (isLoading) return;
              tempProgress = progress;
              setState(() {
                increment = -progress;
              });
              _controller?.forward(from: 0.0);
            },
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            child: const Icon(Icons.arrow_circle_down_sharp),
            onPressed: () {
              if (isLoading || progress == 0.0) return;
              setState(() {
                tempProgress = progress;
                increment = increment.abs() * -1;
                if (tempProgress <= 0.0) {
                  tempProgress = 0.0;
                  progress = 0.0;
                }
                _controller?.forward(from: 0.0);
              });
            },
          ),
        ],
      ),
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
