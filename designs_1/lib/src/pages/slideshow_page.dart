import 'package:designs_1/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  final List<Widget> slides;

  const SlideShowPage({
    super.key,
    required this.slides,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SlideShow Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _Slides(slides),
          ),
          _Dots(this.slides.length),
        ],
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

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
    return SizedBox(
      child: PageView(
        controller: _pageController,
        children: widget.slides
            .map(
              (widget) => _Slide(slide: widget),
            )
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalDots;

  const _Dots(this.totalDots);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalDots,
          (index) => _Dot(index: index, totalDots: totalDots - 1),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final int totalDots;
  const _Dot({required this.index, required this.totalDots});

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
        width: isCurrentPage ? 12.0 : 22.0,
        height: 12.0,
        margin: EdgeInsets.all(isCurrentPage ? 3.0 : 0.0),
        decoration: BoxDecoration(
          color: isCurrentPage ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              isCurrentPage || index == 0
                  ? 12.0
                  : isBeforePage
                      ? 12.0
                      : 0.0,
            ),
            topRight: Radius.circular(
              isCurrentPage || index == totalDots
                  ? 12.0
                  : isNextPage
                      ? 12.0
                      : 0.0,
            ),
            bottomLeft: Radius.circular(
              isCurrentPage || index == 0
                  ? 12.0
                  : isBeforePage
                      ? 12.0
                      : 0.0,
            ),
            bottomRight: Radius.circular(
              isCurrentPage || index == totalDots
                  ? 12.0
                  : isNextPage
                      ? 12.0
                      : 0.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            '$index',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8.0,
            ),
          ),
        ),
      ),
    );
  }
}
