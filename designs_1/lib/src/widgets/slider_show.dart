import 'package:designs_1/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum DotPosition { top, bottom, left, right }

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final DotPosition positionDots;
  final double bulletSize;
  final Color bulletColorActive;
  final Color bulletColorInactive;
  final Axis directionSlides;

  const SlideShow({
    super.key,
    required this.slides,
    this.positionDots = DotPosition.bottom,
    this.bulletSize = 12.0,
    this.bulletColorActive = Colors.blue,
    this.bulletColorInactive = Colors.grey,
    this.directionSlides = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return _buildLayout(context);
  }

  Widget _buildLayout(BuildContext context) {
    switch (positionDots) {
      case DotPosition.top:
      case DotPosition.bottom:
        return Stack(
          alignment: positionDots == DotPosition.top
              ? Alignment.topCenter
              : Alignment.bottomCenter,
          children: [
            _Slides(slides, directionSlides),
            _Dots(slides.length, bulletSize, bulletColorActive,
                bulletColorInactive),
          ],
        );
      case DotPosition.left:
      case DotPosition.right:
        return Stack(
          alignment: positionDots == DotPosition.left
              ? Alignment.centerLeft
              : Alignment.centerRight,
          children: [
            _Slides(slides, directionSlides),
            _buildVerticalDots(context),
          ],
        );
      default:
        return _Slides(slides, directionSlides);
    }
  }

  Widget _buildVerticalDots(BuildContext context) {
    final isLeft = positionDots == DotPosition.left;
    final offsetX =
        (MediaQuery.of(context).size.width / 2) * (isLeft ? -1 : 1) +
            (isLeft ? bulletSize : -bulletSize);
    return Transform.translate(
      offset: Offset(offsetX, 0),
      child: Transform.rotate(
        angle: 90 * 3.1416 / 180,
        child: _Dots(
            slides.length, bulletSize, bulletColorActive, bulletColorInactive),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  final Axis directionSlides;

  const _Slides(this.slides, this.directionSlides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          _pageController.page ?? 0.0;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: widget.directionSlides,
      children: widget.slides
          .map(
            (widget) => _Slide(slide: widget),
          )
          .toList(),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalDots;
  final double bulletSize;
  final Color bulletColorActive;
  final Color bulletColorInactive;

  const _Dots(this.totalDots, this.bulletSize, this.bulletColorActive,
      this.bulletColorInactive);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: bulletSize * 1.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          totalDots,
          (index) => _Dot(
              index: index,
              totalDots: totalDots - 1,
              bulletSize: bulletSize,
              bulletColorActive: bulletColorActive,
              bulletColorInactive: bulletColorInactive),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final int totalDots;
  final double bulletSize;
  final Color bulletColorActive;
  final Color bulletColorInactive;

  const _Dot(
      {required this.index,
      required this.totalDots,
      required this.bulletSize,
      required this.bulletColorActive,
      required this.bulletColorInactive});

  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<SliderModel>(context).currentPage;
    final isCurrentPage =
        (currentPage >= index - 0.5 && currentPage < index + 0.5);
    final isNextPage =
        (currentPage >= index + 0.51 && currentPage < index + 1.51);
    final isBeforePage =
        (currentPage <= index - 0.51 && currentPage > index - 1.51);
    return InkWell(
      onTap: () {
        Provider.of<SliderModel>(context, listen: false).currentPage =
            index.toDouble();
      },
      splashColor: Colors.transparent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: isCurrentPage ? bulletSize : bulletSize * 1.5,
        height: bulletSize,
        margin: EdgeInsets.all(isCurrentPage ? bulletSize * 0.1 : 0.0),
        decoration: BoxDecoration(
          color: isCurrentPage ? bulletColorActive : bulletColorInactive,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              isCurrentPage || index == 0
                  ? bulletSize
                  : isBeforePage
                      ? bulletSize
                      : 0.0,
            ),
            topRight: Radius.circular(
              isCurrentPage || index == totalDots
                  ? bulletSize
                  : isNextPage
                      ? bulletSize
                      : 0.0,
            ),
            bottomLeft: Radius.circular(
              isCurrentPage || index == 0
                  ? bulletSize
                  : isBeforePage
                      ? bulletSize
                      : 0.0,
            ),
            bottomRight: Radius.circular(
              isCurrentPage || index == totalDots
                  ? bulletSize
                  : isNextPage
                      ? bulletSize
                      : 0.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(
              color: Colors.white,
              fontSize: bulletSize * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
