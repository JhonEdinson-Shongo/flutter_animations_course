import 'package:flutter/material.dart';
import 'package:designs_1/src/pages/pages.dart';

class AppRoutes {
  static const initialRoute = 'Home';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll(
        {'Home': (BuildContext context) => const HomePage()});
    appRoutes.addAll(
        {'HeadersPage': (BuildContext context) => const HeadersPage()});
    appRoutes.addAll(
        {'AnimationsPage': (BuildContext context) => const AnimationsPage()});
    appRoutes.addAll(
        {'CustomProgressPage': (BuildContext context) => const CustomProgressPage()});
    appRoutes.addAll(
        {'SlideShowPage': (BuildContext context) => const SlideShowPage()});
    appRoutes.addAll(
        {'PinterestGridPage': (BuildContext context) => PinterestGridPage()});

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertPage());
  }
}
