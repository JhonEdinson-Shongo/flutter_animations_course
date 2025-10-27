import 'dart:async';

import 'package:designs_1/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

class HeaderRounded extends StatelessWidget {
  const HeaderRounded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
        color: AppTheme.primary,
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primary
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderRowDown extends StatelessWidget {
  const HeaderRowDown({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderRowDownPainter(),
      ),
    );
  }
}

class _HeaderRowDownPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primary
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height * 0.8)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderCurvo extends StatelessWidget {
  final Color color;
  final double height;
  const HeaderCurvo({
    super.key,
    this.color = Colors.indigo,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(
          color: color,
        ),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  final Color color;
  _HeaderCurvoPainter({this.color = Colors.indigo});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(
          size.width / 2, size.height + size.height * 0.3, size.width, size.height * 0.7)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primary
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height * 0.8)
      ..quadraticBezierTo(
          size.width * 0.25, size.height, size.width * 0.5, size.height * 0.8)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.6, size.width, size.height * 0.8)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 150.0);

    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppTheme.primary,
        AppTheme.primary.withOpacity(0.75),
        AppTheme.primary.withOpacity(0.2),
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height * 0.85)
      ..quadraticBezierTo(
          size.width * 0.25, size.height, size.width * 0.5, size.height * 0.85)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.7, size.width, size.height * 0.85)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class HeaderLayout1 extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final List<Color> gradientColors;

  const HeaderLayout1({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.gradientColors,
  });

  @override
  State<HeaderLayout1> createState() => _HeaderLayout1State();
}

class _HeaderLayout1State extends State<HeaderLayout1> {
  double scaleIcon = 0.8;
  double opacityIcon = 0;

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 100),
      () => setState(() {
        scaleIcon = 1.0;
        opacityIcon = 1.0;
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BackgroundHeader(gradientColors: widget.gradientColors),
        Positioned(
          top: -MediaQuery.of(context).size.width * 0.25,
          left: -MediaQuery.of(context).size.width * 0.25,
          child: _IconBackgroundHeader(
              opacityIcon: opacityIcon, scaleIcon: scaleIcon, widget: widget),
        ),
        _ContentHeader(widget: widget),
        Positioned(
          top: 40,
          right: 0,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.more_vert_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContentHeader extends StatelessWidget {
  const _ContentHeader({
    super.key,
    required this.widget,
  });

  final HeaderLayout1 widget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30, width: double.infinity),
          Text(
            widget.subTitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.title,
            style: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Icon(
            widget.icon,
            color: Colors.white,
            size: 90,
          ),
        ],
      ),
    );
  }
}

class _IconBackgroundHeader extends StatelessWidget {
  const _IconBackgroundHeader({
    super.key,
    required this.opacityIcon,
    required this.scaleIcon,
    required this.widget,
  });

  final double opacityIcon;
  final double scaleIcon;
  final HeaderLayout1 widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityIcon,
      duration: const Duration(milliseconds: 1000),
      child: AnimatedScale(
        scale: scaleIcon,
        duration: const Duration(milliseconds: 400),
        child: Icon(
          widget.icon,
          color: Colors.white.withOpacity(0.1),
          size: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}

class _BackgroundHeader extends StatelessWidget {
  final List<Color> gradientColors;

  const _BackgroundHeader({required this.gradientColors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.33,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(100),
        ),
        color: gradientColors[0],
        gradient: gradientColors.length > 1
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors,
              )
            : null,
      ),
    );
  }
}
