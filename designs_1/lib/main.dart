import 'package:designs_1/src/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:designs_1/src/router/app_routes.dart';

import 'package:designs_1/src/models/pinterest_model.dart';
import 'package:designs_1/src/models/slider_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SliderModel()),
        ChangeNotifierProvider(create: (context) => PinterestModel()),
        ChangeNotifierProvider(create: (context) => AppTheme()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<AppTheme>(context).currentTheme;
    return MaterialApp(
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      debugShowCheckedModeBanner: false,
      title: 'Diseños flutter',
      theme: currentTheme,
      builder: (context, child) {
        final theme = Provider.of<AppTheme>(context);
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(theme.fontSizeFactor),
          ),
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
