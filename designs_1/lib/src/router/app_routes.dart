import 'package:flutter/material.dart';
import 'package:designs_1/src/pages/pages.dart';

class AppRoutes {
  static const initialRoute = 'SlideShowPage';

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
        {'SlideShowPage': (BuildContext context) => const SlideShowPage(
          slides: [
            Text('Testing'),
            Text('Testing 2'),
            Text('Testing 3'),
            Text('Testing 4'),
            Text('Testing 5'),
            Text('Testing 6'),
            Text('Testing 7'),
            Text('Testing 8'),
            Text('Testing 9'),
            Text('Testing 10'),
          ],
        )});

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertPage());
  }
}
