import 'package:animate_do/animate_do.dart';
import 'package:designs_1/src/widgets/MeasureSize.dart';
import 'package:designs_1/src/widgets/button_list.dart';
import 'package:designs_1/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class ButtonListItem {
  final String title;
  final IconData icon;
  final List<Color> backgroundColors;
  final Function() onPressed;
  final int index;

  ButtonListItem(this.title, this.icon, this.backgroundColors, this.onPressed,
      {required this.index});
}

class Layout1Page extends StatefulWidget {
  Layout1Page({super.key});

  @override
  State<Layout1Page> createState() => _Layout1PageState();
}

class _Layout1PageState extends State<Layout1Page> {
  bool isLarge = false;
  double heightHeader = 0;
  final items = <ButtonListItem>[
    ButtonListItem(
      'Vehículos',
      Icons.car_crash_outlined,
      const [
        Colors.deepPurpleAccent,
        Colors.indigoAccent,
      ],
      () => print('Click en Vehículos'),
      index: 0,
    ),
    ButtonListItem(
      'Juegos de azar',
      Icons.casino_sharp,
      const [
        Colors.indigoAccent,
        Colors.indigo,
      ],
      () => print('Click en Vehículos'),
      index: 1,
    ),
    ButtonListItem(
      'Transmitir',
      Icons.cast_connected_outlined,
      const [
        Colors.deepPurpleAccent,
        Colors.deepOrange,
      ],
      () => print('Click en Transmitir'),
      index: 2,
    ),
    ButtonListItem(
      'Aprender ABC',
      Icons.abc_rounded,
      const [
        Colors.blue,
        Colors.blueGrey,
      ],
      () => print('Click en Aprender ABC'),
      index: 3,
    ),
    ButtonListItem(
      'Clima frío',
      Icons.ac_unit_sharp,
      const [
        Colors.redAccent,
        Colors.deepPurpleAccent,
      ],
      () => print('Click en Clima frío'),
      index: 4,
    ),
    ButtonListItem(
      'Accesibilidad',
      Icons.accessible_sharp,
      const [
        Colors.black87,
        Colors.black,
      ],
      () => print('Click en Accesibilidad'),
      index: 5,
    ),
    ButtonListItem(
      'Android',
      Icons.adb_sharp,
      const [
        Colors.lightGreen,
        Colors.green,
      ],
      () => print('Click en Android'),
      index: 6,
    ),
    ButtonListItem(
      'Zoom',
      Icons.zoom_in_map_rounded,
      const [
        Colors.cyan,
        Colors.pink,
      ],
      () => print('Click en Zoom'),
      index: 7,
    ),
    ButtonListItem(
      'Ubicación',
      Icons.wrong_location_outlined,
      const [Colors.indigo],
      () => print('Click en Ubicación'),
      index: 8,
    ),
    ButtonListItem(
      'Jardín',
      Icons.yard_outlined,
      const [
        Colors.amberAccent,
        Colors.limeAccent,
      ],
      () => print('Click en Jardín'),
      index: 9,
    ),
    ButtonListItem(
      'Vehículos',
      Icons.car_crash_outlined,
      const [
        Colors.deepPurpleAccent,
        Colors.indigoAccent,
      ],
      () => print('Click en Vehículos'),
      index: 0,
    ),
    ButtonListItem(
      'Juegos de azar',
      Icons.casino_sharp,
      const [
        Colors.indigoAccent,
        Colors.indigo,
      ],
      () => print('Click en Vehículos'),
      index: 1,
    ),
    ButtonListItem(
      'Transmitir',
      Icons.cast_connected_outlined,
      const [
        Colors.deepPurpleAccent,
        Colors.deepOrange,
      ],
      () => print('Click en Transmitir'),
      index: 2,
    ),
    ButtonListItem(
      'Aprender ABC',
      Icons.abc_rounded,
      const [
        Colors.blue,
        Colors.blueGrey,
      ],
      () => print('Click en Aprender ABC'),
      index: 3,
    ),
    ButtonListItem(
      'Clima frío',
      Icons.ac_unit_sharp,
      const [
        Colors.redAccent,
        Colors.deepPurpleAccent,
      ],
      () => print('Click en Clima frío'),
      index: 4,
    ),
    ButtonListItem(
      'Accesibilidad',
      Icons.accessible_sharp,
      const [
        Colors.black87,
        Colors.black,
      ],
      () => print('Click en Accesibilidad'),
      index: 5,
    ),
    ButtonListItem(
      'Android',
      Icons.adb_sharp,
      const [
        Colors.lightGreen,
        Colors.green,
      ],
      () => print('Click en Android'),
      index: 6,
    ),
    ButtonListItem(
      'Zoom',
      Icons.zoom_in_map_rounded,
      const [
        Colors.cyan,
        Colors.pink,
      ],
      () => print('Click en Zoom'),
      index: 7,
    ),
    ButtonListItem(
      'Ubicación',
      Icons.wrong_location_outlined,
      const [Colors.indigo],
      () => print('Click en Ubicación'),
      index: 8,
    ),
    ButtonListItem(
      'Jardín',
      Icons.yard_outlined,
      const [
        Colors.amberAccent,
        Colors.limeAccent,
      ],
      () => print('Click en Jardín'),
      index: 9,
    ),
    ButtonListItem(
      'Vehículos',
      Icons.car_crash_outlined,
      const [
        Colors.deepPurpleAccent,
        Colors.indigoAccent,
      ],
      () => print('Click en Vehículos'),
      index: 0,
    ),
    ButtonListItem(
      'Juegos de azar',
      Icons.casino_sharp,
      const [
        Colors.indigoAccent,
        Colors.indigo,
      ],
      () => print('Click en Vehículos'),
      index: 1,
    ),
    ButtonListItem(
      'Transmitir',
      Icons.cast_connected_outlined,
      const [
        Colors.deepPurpleAccent,
        Colors.deepOrange,
      ],
      () => print('Click en Transmitir'),
      index: 2,
    ),
    ButtonListItem(
      'Aprender ABC',
      Icons.abc_rounded,
      const [
        Colors.blue,
        Colors.blueGrey,
      ],
      () => print('Click en Aprender ABC'),
      index: 3,
    ),
    ButtonListItem(
      'Clima frío',
      Icons.ac_unit_sharp,
      const [
        Colors.redAccent,
        Colors.deepPurpleAccent,
      ],
      () => print('Click en Clima frío'),
      index: 4,
    ),
    ButtonListItem(
      'Accesibilidad',
      Icons.accessible_sharp,
      const [
        Colors.black87,
        Colors.black,
      ],
      () => print('Click en Accesibilidad'),
      index: 5,
    ),
    ButtonListItem(
      'Android',
      Icons.adb_sharp,
      const [
        Colors.lightGreen,
        Colors.green,
      ],
      () => print('Click en Android'),
      index: 6,
    ),
    ButtonListItem(
      'Zoom',
      Icons.zoom_in_map_rounded,
      const [
        Colors.cyan,
        Colors.pink,
      ],
      () => print('Click en Zoom'),
      index: 7,
    ),
    ButtonListItem(
      'Ubicación',
      Icons.wrong_location_outlined,
      const [Colors.indigo],
      () => print('Click en Ubicación'),
      index: 8,
    ),
    ButtonListItem(
      'Jardín',
      Icons.yard_outlined,
      const [
        Colors.amberAccent,
        Colors.limeAccent,
      ],
      () => print('Click en Jardín'),
      index: 9,
    ),
  ];



  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.height > 500) {
      setState(() {
        isLarge = true;
      });
    } else {
      setState(() {
        isLarge = false;
      });
    }
    final buttons = items
        .map((item) => isLarge && item.index % 2 == 0
            ? FadeInLeft(
                duration: const Duration(milliseconds: 400),
                from: 100,
                child: ButtonList(
                  icon: item.icon,
                  title: item.title,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColors: item.backgroundColors,
                  onPressed: () => item.onPressed,
                ),
              )
            : FadeInRight(
                duration: const Duration(milliseconds: 400),
                from: 100,
                child: ButtonList(
                  icon: item.icon,
                  title: item.title,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColors: item.backgroundColors,
                  onPressed: () => item.onPressed,
                ),
              ))
        .toList();
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: isLarge
                    ? GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 3.5,
                        padding: EdgeInsets.only(top: heightHeader + 20),
                        children: [
                          ...buttons
                        ],
                      )
                    : ListView(
                        physics: const BouncingScrollPhysics(),
                        cacheExtent: 100.0,
                        children: [
                          Padding(padding: EdgeInsets.only(top: heightHeader)),
                          ...buttons
                        ],
                      ),
              ),
            ],
          ),
          MeasureSize(
            onChange: (size) => setState(() => heightHeader = size.height),
            child: const HeaderLayout1(
              gradientColors: [
                Colors.indigoAccent,
                Colors.indigo,
              ],
              icon: Icons.add_alarm_sharp,
              title: 'Soy un titulo',
              subTitle: 'Soy un subtitulo',
            ),
          ),
        ],
      ),
    );
  }
}
