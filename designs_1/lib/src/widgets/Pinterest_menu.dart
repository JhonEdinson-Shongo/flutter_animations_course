import 'package:designs_1/src/models/pinterest_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;
  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items;
  final Widget child;
  const PinterestMenu({super.key, required this.child, required this.items});

  double calcaulatePosition(BuildContext context) {
    // Se crea esta función para calcular la posición del menu, ya que se desea que se pueda
    // dar click a los costados del menu sin importar el número de items
    double middleWidth = MediaQuery.of(context).size.width / 2;
    double middleWidthItems = ((items.length * 51) / 2);
    double middleWidthBackground = 10;
    return middleWidth - middleWidthItems - middleWidthBackground;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          bottom: 20,
          left: calcaulatePosition(context),
          child: _PinterestMenuBackground(items: items),
        ),
      ],
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final List<PinterestButton> items;
  const _PinterestMenuBackground({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.85,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
          ? const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 3,
                  spreadRadius: -6,
                  offset: Offset(0, 5),
                )
              ],
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
              color: isCurentItem ? Colors.blue : Colors.blueGrey[800],
            ),
          ),
        ),
      ),
    );
  }
}
