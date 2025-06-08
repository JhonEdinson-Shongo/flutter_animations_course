import 'package:flutter/material.dart';
import 'package:template_app/src/pages/pages.dart';

class AppRoutes {
  static const initialRoute = 'Home';

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll(
        {'HeadersPage': (BuildContext context) => const HeadersPage()});
    appRoutes.addAll(
        {'Home': (BuildContext context) => const HomePage()});

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertPage());
  }
}
