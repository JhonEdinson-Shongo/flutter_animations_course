import 'package:animate_do/animate_do.dart';
import 'package:designs_1/src/widgets/button_list.dart';
import 'package:designs_1/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class ButtonListItem {
  final String title;
  final IconData icon;
  final List<Color> backgroundColors;
  final Function onPressed;
  final int index;

  ButtonListItem(
    this.title,
    this.icon,
    this.backgroundColors,
    this.onPressed,
    { required this.index}
  );
}

class Layout1Page extends StatelessWidget {
  Layout1Page({super.key});

  final items = <ButtonListItem> [
    ButtonListItem('Vehículos', Icons.car_crash_outlined, const [ Colors.deepPurpleAccent, Colors.indigoAccent, ], () => print('Click en Vehículos'), index: 0),
    ButtonListItem('Juegos de azar', Icons.casino_sharp, const [ Colors.indigoAccent, Colors.indigo, ], () => print('Click en Vehículos'), index: 1),
    ButtonListItem('Transmitir', Icons.cast_connected_outlined, const [ Colors.deepPurpleAccent, Colors.deepOrange, ], () => print('Click en Transmitir'), index: 2),
    ButtonListItem('Aprender ABC', Icons.abc_rounded, const [ Colors.blue, Colors.blueGrey, ], () => print('Click en Aprender ABC'), index:3 ),
    ButtonListItem('Clima frío', Icons.ac_unit_sharp, const [ Colors.redAccent, Colors.deepPurpleAccent, ], () => print('Click en Clima frío'), index: 4),
    ButtonListItem('Accesibilidad', Icons.accessible_sharp, const [ Colors.black87, Colors.black, ], () => print('Click en Accesibilidad'), index: 5),
    ButtonListItem('Android', Icons.adb_sharp, const [ Colors.lightGreen, Colors.green, ], () => print('Click en Android'), index: 6),
    ButtonListItem('Zoom', Icons.zoom_in_map_rounded, const [ Colors.cyan, Colors.pink, ], () => print('Click en Zoom'), index: 7),
    ButtonListItem('Ubicación', Icons.wrong_location_outlined, const [ Colors.indigo ], () => print('Click en Ubicación'), index: 8),
    ButtonListItem('Jardín', Icons.yard_outlined, const [ Colors.amberAccent, Colors.limeAccent, ], () => print('Click en Jardín'), index: 9),
    ButtonListItem('Vehículos', Icons.car_crash_outlined, const [ Colors.deepPurpleAccent, Colors.indigoAccent, ], () => print('Click en Vehículos'), index: 0),
    ButtonListItem('Juegos de azar', Icons.casino_sharp, const [ Colors.indigoAccent, Colors.indigo, ], () => print('Click en Vehículos'), index: 1),
    ButtonListItem('Transmitir', Icons.cast_connected_outlined, const [ Colors.deepPurpleAccent, Colors.deepOrange, ], () => print('Click en Transmitir'), index: 2),
    ButtonListItem('Aprender ABC', Icons.abc_rounded, const [ Colors.blue, Colors.blueGrey, ], () => print('Click en Aprender ABC'), index:3 ),
    ButtonListItem('Clima frío', Icons.ac_unit_sharp, const [ Colors.redAccent, Colors.deepPurpleAccent, ], () => print('Click en Clima frío'), index: 4),
    ButtonListItem('Accesibilidad', Icons.accessible_sharp, const [ Colors.black87, Colors.black, ], () => print('Click en Accesibilidad'), index: 5),
    ButtonListItem('Android', Icons.adb_sharp, const [ Colors.lightGreen, Colors.green, ], () => print('Click en Android'), index: 6),
    ButtonListItem('Zoom', Icons.zoom_in_map_rounded, const [ Colors.cyan, Colors.pink, ], () => print('Click en Zoom'), index: 7),
    ButtonListItem('Ubicación', Icons.wrong_location_outlined, const [ Colors.indigo ], () => print('Click en Ubicación'), index: 8),
    ButtonListItem('Jardín', Icons.yard_outlined, const [ Colors.amberAccent, Colors.limeAccent, ], () => print('Click en Jardín'), index: 9),
    ButtonListItem('Vehículos', Icons.car_crash_outlined, const [ Colors.deepPurpleAccent, Colors.indigoAccent, ], () => print('Click en Vehículos'), index: 0),
    ButtonListItem('Juegos de azar', Icons.casino_sharp, const [ Colors.indigoAccent, Colors.indigo, ], () => print('Click en Vehículos'), index: 1),
    ButtonListItem('Transmitir', Icons.cast_connected_outlined, const [ Colors.deepPurpleAccent, Colors.deepOrange, ], () => print('Click en Transmitir'), index: 2),
    ButtonListItem('Aprender ABC', Icons.abc_rounded, const [ Colors.blue, Colors.blueGrey, ], () => print('Click en Aprender ABC'), index:3 ),
    ButtonListItem('Clima frío', Icons.ac_unit_sharp, const [ Colors.redAccent, Colors.deepPurpleAccent, ], () => print('Click en Clima frío'), index: 4),
    ButtonListItem('Accesibilidad', Icons.accessible_sharp, const [ Colors.black87, Colors.black, ], () => print('Click en Accesibilidad'), index: 5),
    ButtonListItem('Android', Icons.adb_sharp, const [ Colors.lightGreen, Colors.green, ], () => print('Click en Android'), index: 6),
    ButtonListItem('Zoom', Icons.zoom_in_map_rounded, const [ Colors.cyan, Colors.pink, ], () => print('Click en Zoom'), index: 7),
    ButtonListItem('Ubicación', Icons.wrong_location_outlined, const [ Colors.indigo ], () => print('Click en Ubicación'), index: 8),
    ButtonListItem('Jardín', Icons.yard_outlined, const [ Colors.amberAccent, Colors.limeAccent, ], () => print('Click en Jardín'), index: 9),
  ];

  @override
  Widget build(BuildContext context) {
    final buttons = items.map(
      (item) => FadeInLeft(
        duration: const Duration( milliseconds: 400 ),
        from: 100,
        child: ButtonList(
          icon: item.icon,
          title: item.title,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColors: item.backgroundColors,
          onPressed: () => item.onPressed,
        ),
      )
    ).toList();
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 300),
            cacheExtent: 100,
            children: <Widget>[
              ...buttons,
            ],
          ),
          const HeaderLayout1(
            gradientColors: [
              Colors.indigoAccent,
              Colors.indigo,
            ],
            icon: Icons.add_alarm_sharp,
            title: 'Soy un titulo',
            subTitle: 'Soy un subtitulo',
          ),
        ],
      ),
    );
  }
}
