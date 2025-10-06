import 'package:designs_1/src/models/pinterest_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  final String label;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  PinterestButton({
    this.label = '',
    this.activeColor = const Color(0xFF2196F3),
    this.inactiveColor = const Color(0xFF37474F),
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
    required this.icon,
  });
}

class PinterestMenu extends StatefulWidget {
  final List<PinterestButton> items;
  final Color backgroundColor;
  final Widget child;
  const PinterestMenu({
    super.key,
    required this.child,
    required this.items,
    this.backgroundColor = const Color(0xFFFFFFFF),
  });

  @override
  State<PinterestMenu> createState() => _PinterestMenuState();
}

class _PinterestMenuState extends State<PinterestMenu>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  double calcaulatePosition(BuildContext context) {
    // Se crea esta función para calcular la posición del menu, ya que se desea que se pueda
    // dar click a los costados del menu sin importar el número de items
    double middleWidth = MediaQuery.of(context).size.width / 2;
    double middleWidthItems = ((widget.items.length * 51) / 2);
    double middleWidthBackground = 10;
    return middleWidth - middleWidthItems - middleWidthBackground;
  }

  @override
  Widget build(BuildContext context) {
    bool showMenu = Provider.of<PinterestModel>(context).showMenu;
    if (showMenu) {
      _controller!.reverse();
    } else {
      _controller!.forward();
    }
    return Stack(
      children: [
        widget.child,
        Positioned(
          bottom: 20,
          left: calcaulatePosition(context),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: showMenu ? 1 : 0,
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) => Transform.translate(
                offset: Offset(
                  0,
                  _controller!.value * (25 + 16 + 20 + 20),
                ),
                child: child,
              ),
              child: _PinterestMenuBackground(
                  items: widget.items, backgroundColor: widget.backgroundColor),
            ),
          ),
        ),
      ],
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final List<PinterestButton> items;
  final Color backgroundColor;
  const _PinterestMenuBackground({
    super.key,
    required this.items,
    this.backgroundColor = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.85,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: _MenuItems(items),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(menuItems.length,
          (i) => _PinterestMenuButton(index: i, item: menuItems[i])),
    );
  }
}

class _PinterestMenuButton extends StatefulWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton({required this.index, required this.item});

  @override
  State<_PinterestMenuButton> createState() => _PinterestMenuButtonState();
}

class _PinterestMenuButtonState extends State<_PinterestMenuButton>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationScale;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
    _animationScale = Tween<double>(begin: 1, end: 1.3).animate(CurvedAnimation(
      parent: _controller!,
      curve: const Interval(0, 1, curve: Curves.easeInOut),
      reverseCurve: const Interval(0, 1, curve: Curves.easeInOut),
    ));
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = Provider.of<PinterestModel>(context).currentItem;
    bool isCurentItem = currentItem == widget.index;
    if (isCurentItem) {
      _controller!.forward();
    } else {
      _controller!.reverse();
    }
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: isCurentItem
          ? BoxDecoration(
              color: widget.item.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            )
          : null,
      child: GestureDetector(
        onTap: () {
          context.read<PinterestModel>().currentItem = widget.index;
          widget.item.onPressed();
        },
        behavior: HitTestBehavior.translucent,
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) => Transform.scale(
            scale: _animationScale!.value,
            child: child,
          ),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.item.icon,
              size: 25.0,
              color: isCurentItem
                  ? widget.item.activeColor
                  : widget.item.inactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}
