import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double progress;
  const RadialProgress({
    super.key,
    required this.progress,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Text('Progress: ${widget.progress}');
  }
}
