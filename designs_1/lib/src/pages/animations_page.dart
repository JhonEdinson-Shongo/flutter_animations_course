import 'package:designs_1/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnimatedSquare(),
            const SizedBox(height: 20),
            const AnimatedSquareFade(),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: const AnimatedSquareRight(),
            ),
            const SizedBox(height: 20),
            const AnimatedSquareRightEnlarge(),
            const SizedBox(height: 20),
            const AnimatedSquareMove(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});
  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animationRotation = Tween<double>(begin: 0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.repeat();
      }
    });
    if (mounted) {
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      child: _Rectangle(),
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationRotation!.value,
          child: child,
        );
      },
    );
  }
}

class AnimatedSquareFade extends StatefulWidget {
  const AnimatedSquareFade({super.key});
  @override
  State<AnimatedSquareFade> createState() => _AnimatedSquareFadeState();
}

class _AnimatedSquareFadeState extends State<AnimatedSquareFade>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationRotation;
  Animation<double>? _animationOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animationRotation = Tween<double>(begin: 0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );

    _animationOpacity = Tween<double>(begin: 0.1, end: 1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0, 1, curve: Curves.easeIn),
        reverseCurve: const Interval(0, 1, curve: Curves.easeIn),
      ),
    );

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });
    if (mounted) {
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      child: _Rectangle(),
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationRotation!.value,
          child: Opacity(
            opacity: _animationOpacity!.value,
            child: child,
          ),
        );
      },
    );
  }
}

class AnimatedSquareRight extends StatefulWidget {
  const AnimatedSquareRight({super.key});
  @override
  State<AnimatedSquareRight> createState() => _AnimatedSquareRightState();
}

class _AnimatedSquareRightState extends State<AnimatedSquareRight>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationRotation;
  Animation<double>? _animationOpacity;
  Animation<double>? _animationTranslate;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animationRotation = Tween<double>(begin: 0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );

    _animationOpacity = Tween<double>(begin: 1, end: 0.1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0, 1, curve: Curves.easeIn),
        reverseCurve: const Interval(0, 1, curve: Curves.easeIn),
      ),
    );

    _animationTranslate = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: const Interval(0, 1, curve: Curves.easeInOut)));

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });
    if (mounted) {
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      child: _Rectangle(),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.translate(
              offset: Offset(
                _animationTranslate!.value *
                    (MediaQuery.of(context).size.width - 120),
                0,
              ),
              child: Transform.rotate(
                angle: _animationRotation!.value,
                child: Opacity(
                  opacity: _animationOpacity!.value,
                  child: child,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(
                _animationTranslate!.value *
                    (MediaQuery.of(context).size.width - 120),
                0,
              ),
              child: const Text('Jhon',
                  style: TextStyle(fontSize: 25, color: AppTheme.white)),
            ),
          ],
        );
      },
    );
  }
}

class AnimatedSquareRightEnlarge extends StatefulWidget {
  const AnimatedSquareRightEnlarge({super.key});
  @override
  State<AnimatedSquareRightEnlarge> createState() =>
      _AnimatedSquareRightEnlargeState();
}

class _AnimatedSquareRightEnlargeState extends State<AnimatedSquareRightEnlarge>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationRotation;
  Animation<double>? _animationOpacity;
  Animation<double>? _animationTranslate;
  Animation<double>? _animationEnlarge;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animationRotation = Tween<double>(begin: 0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeInOut,
      ),
    );

    _animationOpacity = Tween<double>(begin: 0.2, end: 1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0, 1, curve: Curves.easeIn),
        reverseCurve: const Interval(0, 1, curve: Curves.easeIn),
      ),
    );

    _animationTranslate = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: const Interval(0, 1, curve: Curves.easeInOut)));

    _animationEnlarge =
        Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(
      parent: _controller!,
      curve: const Interval(0, 1, curve: Curves.easeInOut),
      reverseCurve: const Interval(0, 1, curve: Curves.easeInOut),
    ));

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });
    if (mounted) {
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      child: _Rectangle(),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: _animationEnlarge!.value,
              child: Transform.translate(
                offset: Offset(
                  _animationTranslate!.value *
                      (MediaQuery.of(context).size.width - 120),
                  0,
                ),
                child: Transform.rotate(
                  angle: _animationRotation!.value,
                  child: Opacity(
                    opacity: _animationOpacity!.value,
                    child: child,
                  ),
                ),
              ),
            ),
            Transform.scale(
              scale: _animationEnlarge!.value,
              child: Transform.translate(
                offset: Offset(
                  _animationTranslate!.value *
                      (MediaQuery.of(context).size.width - 120),
                  0,
                ),
                child: const Text('Jhon',
                    style: TextStyle(fontSize: 25, color: AppTheme.white)),
              ),
            ),
          ],
        );
      },
    );
  }
}

class AnimatedSquareMove extends StatefulWidget {
  const AnimatedSquareMove({super.key});
  @override
  State<AnimatedSquareMove> createState() => _AnimatedSquareMoveState();
}

class _AnimatedSquareMoveState extends State<AnimatedSquareMove>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationTranslateRight;
  Animation<double>? _animationTranslateLeft;
  Animation<double>? _animationTranslateUp;
  Animation<double>? _animationTranslateDown;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));

    _animationTranslateRight = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0, 0.25, curve: Curves.decelerate),
      ),
    );
    _animationTranslateDown = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut),
      ),
    );
    _animationTranslateLeft = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.5, 0.75, curve: Curves.decelerate),
      ),
    );
    _animationTranslateUp = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.75, 1, curve: Curves.bounceOut),
      ),
    );

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reset();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });
    if (mounted) {
      _controller!.forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      child: _Rectangle(),
      builder: (context, child) {
        return Container(
          color: Colors.black.withOpacity(0.1),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topLeft,
          height: 160,
          child: Transform.translate(
            offset: Offset(
              (_animationTranslateRight!.value -
                      _animationTranslateLeft!.value) *
                  (MediaQuery.of(context).size.width - 120),
              (_animationTranslateDown!.value - _animationTranslateUp!.value) * 80,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(child: child),
                const Text('Jhon',
                    style: TextStyle(fontSize: 25, color: AppTheme.white)),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: AppTheme.secondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
