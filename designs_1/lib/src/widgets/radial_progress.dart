import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double progress;
  final double stroke;
  final double secondStroke;
  final Color colorProgress;
  final Color colorBackground;
  final Curve curve;
  final int animationDuration;

  const RadialProgress({
    super.key,
    required this.progress,
    this.stroke = 10.0,
    this.colorProgress = Colors.indigo,
    this.colorBackground = Colors.grey,
    this.curve = Curves.linear,
    this.secondStroke = 0.0,
    this.animationDuration = 500,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationProgress;
  double progress = 0.0;
  double tempProgress = 0.0;
  double increment = 0.0;
  bool isLoading = false;

  @override
  void initState() {
    progress = widget.progress;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );

    _animationProgress = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: widget.curve,
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
          tempProgress = progress;
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
    setState(() {
      increment = widget.progress - tempProgress;
      if (widget.progress < 0.0 || widget.progress > 1.0) return;
      if (isLoading || progress == widget.progress) return;
      _controller?.forward(from: 0.0);
    });
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _CustomRadialProgress(
          progress,
          widget.stroke,
          widget.colorProgress,
          widget.colorBackground,
          widget.secondStroke > 0.0 ? widget.secondStroke : widget.stroke / 2,
        ),
      ),
    );
  }
}

class _CustomRadialProgress extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final double secondStrokeWidth;
  final Color colorProgress;
  final Color colorBackground;

  _CustomRadialProgress(
    this.progress,
    this.strokeWidth,
    this.colorProgress,
    this.colorBackground,
    this.secondStrokeWidth,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // final Rect rect = Rect.fromCircle(
    //   center: Offset(size.width * 0.5, size.height * 0.5),
    //   radius: size.width*0.5,
    // );

    // const Gradient gradient = SweepGradient(
    //   colors: [
    //     Colors.green,
    //     Colors.blue,
    //     Colors.yellow,
    //     Colors.red,
    //   ],
    //   transform: GradientRotation(-pi / 2),
    // );

    final paint = Paint()
      ..color = colorBackground
      ..style = PaintingStyle.stroke
      ..strokeWidth = secondStrokeWidth;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius = min(
      size.width * 0.5 - secondStrokeWidth,
      size.height * 0.5 - secondStrokeWidth,
    );

    canvas.drawCircle(center, radius, paint);

    double arcAngle = 2 * pi * progress;

    final paintArc = Paint()
      ..color = colorProgress
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
      // ..shader = gradient.createShader(rect);

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
