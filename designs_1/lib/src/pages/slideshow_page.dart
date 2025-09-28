import 'package:designs_1/src/themes/app_theme.dart';
import 'package:designs_1/src/widgets/slider_show.dart';
import 'package:flutter/material.dart';

class SlideShowPage extends StatefulWidget {
  const SlideShowPage({
    super.key,
  });

  @override
  State<SlideShowPage> createState() => _SlideShowPageState();
}

class _SlideShowPageState extends State<SlideShowPage> {
  DotPosition dotPosition = DotPosition.bottom;
  double bulletSize = 15;
  Axis directionSlides = Axis.horizontal;

  ButtonStyle _buttonStyle(DotPosition dotPositionButton) {
    return TextButton.styleFrom(
      foregroundColor:
          dotPosition == dotPositionButton ? AppTheme.primary : Colors.black,
      backgroundColor: dotPosition == dotPositionButton
          ? AppTheme.primary.withOpacity(0.1)
          : Colors.transparent,
      shape: const StadiumBorder(),
      side: BorderSide(
        color:
            dotPosition == dotPositionButton ? AppTheme.primary : Colors.black,
        width: 1.0,
      ),
    );
  }

  ButtonStyle _buttonStyleDirection(Axis direction) {
    return TextButton.styleFrom(
      foregroundColor:
          directionSlides == direction ? AppTheme.primary : Colors.black,
      backgroundColor: directionSlides == direction
          ? AppTheme.primary.withOpacity(0.1)
          : Colors.transparent,
      shape: const StadiumBorder(),
      side: BorderSide(
        color:
            directionSlides == direction ? AppTheme.primary : Colors.black,
        width: 1.0,
      ),
    );
  }

  void changeDotPosition(DotPosition dotPositionButton) {
    setState(() {
      dotPosition = dotPositionButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SlideShow Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: SlideShow(
                slides: [
                  Container(color: Colors.red, child: const Text('Testing')),
                  Container(color: Colors.brown, child: const Text('Testing')),
                  Container(color: Colors.teal, child: const Text('Testing')),
                  Container(
                      color: Colors.greenAccent, child: const Text('Testing')),
                  Container(color: Colors.purple, child: const Text('Testing')),
                  Container(color: Colors.amber, child: const Text('Testing')),
                  Container(
                      color: Colors.blueGrey, child: const Text('Testing')),
                  Container(color: Colors.blue, child: const Text('Testing')),
                ],
                positionDots: dotPosition,
                bulletSize: bulletSize,
                bulletColorActive: AppTheme.primary,
                bulletColorInactive: Colors.black54,
                directionSlides: directionSlides,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Dots position:'),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: _buttonStyle(DotPosition.top),
                    onPressed: () => changeDotPosition(DotPosition.top),
                    child: const Text('Top'),
                  ),
                  TextButton(
                    style: _buttonStyle(DotPosition.bottom),
                    onPressed: () => changeDotPosition(DotPosition.bottom),
                    child: const Text('Bottom'),
                  ),
                  TextButton(
                    style: _buttonStyle(DotPosition.left),
                    onPressed: () => changeDotPosition(DotPosition.left),
                    child: const Text('Left'),
                  ),
                  TextButton(
                    style: _buttonStyle(DotPosition.right),
                    onPressed: () => changeDotPosition(DotPosition.right),
                    child: const Text('Right'),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 30,
            ),
            Text.rich(
              TextSpan(
                text: 'Bullet size: ',
                children: [
                  TextSpan(
                    text: '${bulletSize.toInt()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: bulletSize,
              min: 10,
              max: 30,
              onChanged: (value) {
                setState(() {
                  bulletSize = value;
                });
              },
            ),
            const Divider(
              height: 30,
            ),
            const Text('Direction slides:'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: _buttonStyleDirection(Axis.horizontal),
                  onPressed: () => setState(() => directionSlides = Axis.horizontal),
                  child: const Text('Horizontal'),
                ),
                const SizedBox(width: 10),
                TextButton(
                  style: _buttonStyleDirection(Axis.vertical),
                  onPressed: () => setState(() => directionSlides = Axis.vertical),
                  child: const Text('Vertical'),
                ),
              ],
            ),
            const Divider(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
