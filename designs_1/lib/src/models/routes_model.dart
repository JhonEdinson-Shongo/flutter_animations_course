import 'package:flutter/material.dart';

final List<_RouteItem> appRoutes = [
  _RouteItem(title: 'Headers Custonpainter', icon: Icons.format_shapes_outlined, routeNamed: 'HeadersPage'),
  _RouteItem(title: 'Animations', icon: Icons.animation_outlined, routeNamed: 'AnimationsPage'),
  _RouteItem(title: 'Custom Progress', icon: Icons.refresh_rounded, routeNamed: 'CustomProgressPage'),
  _RouteItem(title: 'SlideShow', icon: Icons.slideshow, routeNamed: 'SlideShowPage'),
  _RouteItem(title: 'Pinterest Grid', icon: Icons.grid_view, routeNamed: 'PinterestGridPage'),
  _RouteItem(title: 'Layout 1 ListView', icon: Icons.layers_outlined, routeNamed: 'Layout1Page'),
  _RouteItem(title: 'Layout 2 Slivers', icon: Icons.splitscreen_rounded, routeNamed: 'Layout2Page'),
];

class _RouteItem {
  final String title;
  final IconData icon;
  final String routeNamed;

  _RouteItem({
    required this.title,
    required this.icon,
    required this.routeNamed,
  });
}