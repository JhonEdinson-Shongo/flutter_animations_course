import 'package:designs_1/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/headers.dart';

class Layout2Page extends StatelessWidget {
  const Layout2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.indigo[50],
        child: Stack(
          children: [
            _MainScroll(),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width - 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: theme.secondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Text(
                    'CREATE SOMETHING NEW',
                    style: TextStyle(
                      color: theme.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return CustomScrollView(
      slivers: [
        // Es un appbar qeu se puede quedar tipo fixed o floating en el scroll
        // const SliverAppBar(
        //   floating: true,
        //   backgroundColor: AppTheme.primary,
        //   title: Text('Custom Scroll'),
        //   centerTitle: true,
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _CustomAppBar(
            minHeight: 200,
            maxHeight: 200,
            child: Stack(
              children: [
                HeaderCurvo(
                  color: theme.secondary,
                  height: 200,
                ),
                Center(
                  child: Text(
                    'Custom Scroll',
                    style: TextStyle(
                      color: theme.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...List.generate(
              20,
              (index) => _ItemList(index),
            ),
            const SizedBox(height: 100),
          ]),
        ),
      ],
    );
  }
}

class _CustomAppBar extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _CustomAppBar({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight < minHeight ? minHeight : maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _CustomAppBar oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _ItemList extends StatelessWidget {
  final int index;
  const _ItemList(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Text(
        'Item $index',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
