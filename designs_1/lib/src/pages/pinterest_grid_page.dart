import 'dart:math';

import 'package:designs_1/src/models/pinterest_model.dart';
import 'package:designs_1/src/widgets/Pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestGridPage extends StatelessWidget {
  PinterestGridPage({super.key});

  final itemsMenu = [
    PinterestButton(
      onPressed: () => print('click pie_chart'),
      icon: Icons.pie_chart,
      activeColor: Colors.red,
    ),
    PinterestButton(
      onPressed: () => print('click search'),
      icon: Icons.search,
      activeColor: Colors.green,
    ),
    PinterestButton(
      onPressed: () => print('click notifications'),
      icon: Icons.notifications,
      activeColor: Colors.cyanAccent,
    ),
    PinterestButton(
      onPressed: () => print('click supervised_user_circle'),
      icon: Icons.supervised_user_circle,
      activeColor: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Pinterest Page'),
      ),
      body: PinterestMenu(
        backgroundColor: Colors.white,
        items: itemsMenu,
        child: const PinterestGrid(),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(60, (index) => index);
  final ScrollController _scrollController = ScrollController();
  double _lastScrollOffset = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset > _lastScrollOffset &&
        _scrollController.offset > MediaQuery.of(context).size.height / 2
      ) {
        Provider.of<PinterestModel>(context, listen: false).showMenu = false;
      } else {
        Provider.of<PinterestModel>(context, listen: false).showMenu = true;
      }
      _lastScrollOffset = _scrollController.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightFor(int index) {
      final r = Random(index);
      return 200 + r.nextInt(120).toDouble();
    }
    final bool isLarge;
    if (MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    return MasonryGridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(12),
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLarge ? 4 : 2,
      ),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final color = Colors.primaries[index % Colors.primaries.length];
        final height = heightFor(index);
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: height,
            color: color,
            child: Center(
              child: Text(
                'Card #$index',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
