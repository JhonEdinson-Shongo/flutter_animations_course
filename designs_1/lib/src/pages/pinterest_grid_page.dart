import 'dart:math';

import 'package:designs_1/src/widgets/Pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestGridPage extends StatelessWidget {
  PinterestGridPage({super.key});

  final itemsMenu = [
    PinterestButton(
      onPressed: () => print('click pie_chart'),
      icon: Icons.pie_chart,
    ),
    PinterestButton(
      onPressed: () => print('click search'),
      icon: Icons.search,
    ),
    PinterestButton(
      onPressed: () => print('click notifications'),
      icon: Icons.notifications,
    ),
    PinterestButton(
      onPressed: () => print('click supervised_user_circle'),
      icon: Icons.supervised_user_circle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Pinterest Page'),
      ),
      body: PinterestMenu(
        items: itemsMenu,
        child: const PinterestGrid(),
      ),
    );
  }
}

class PinterestGrid extends StatelessWidget {
  const PinterestGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> items = List.generate(30, (index) => index);

    double heightFor(int index) {
      final r = Random(index);
      return 200 + r.nextInt(120).toDouble();
    }

    return MasonryGridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
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
                  color: Colors.white,
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
