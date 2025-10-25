import 'package:designs_1/src/models/routes_model.dart';
import 'package:designs_1/src/themes/app_theme.dart';
import 'package:designs_1/src/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        drawer: _MenuPrincipal(),
        body: _ListNavigation());
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeApp>(context);
    final theme = AppTheme();
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.primary,
              image: const DecorationImage(
                image: AssetImage('assets/freepik_1.jpg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: theme.primary,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Shongo Dev',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Text(
              'Navigation Menu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: _ListNavigation(),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
              value: appTheme.isDarkTheme,
              activeColor: Colors.blue,
              onChanged: (value) => appTheme.isDarkTheme = value,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
              value: appTheme.isCustomTheme,
              activeColor: Colors.blue,
              onChanged: (value) => appTheme.isCustomTheme = value,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemCount: appRoutes.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        final route = appRoutes[index];
        return ListTile(
          title: Text(route.title),
          leading: Icon(route.icon),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.pushNamed(context, route.routeNamed),
        );
      },
    );
  }
}
