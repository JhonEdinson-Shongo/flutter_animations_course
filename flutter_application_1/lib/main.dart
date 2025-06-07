import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/router/app_routes.dart';
import 'package:flutter_application_1/src/themes/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    // final _navKey = GlobalKey<NavigatorState>();
    return MaterialApp(
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      // navigatorKey: _navKey,
      debugShowCheckedModeBanner: false,
      title: 'Diseños flutter',
      theme: AppTheme.themeLight,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
          child: child!,
        );
      },
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
    );
  }
}
