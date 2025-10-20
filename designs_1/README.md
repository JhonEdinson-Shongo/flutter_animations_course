# designs_1 — Demos de Animaciones y Patrones UI

![Flutter](https://img.shields.io/badge/Flutter-3%2B-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-2%2B-0175C2?logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/State%20Mgmt-Provider-7F52FF?logo=flutter&logoColor=white)
![animate_do](https://img.shields.io/badge/Package-animate__do-00BCD4)
![Staggered%20Grid](https://img.shields.io/badge/Package-flutter__staggered__grid__view-6A1B9A)
![CustomPainter](https://img.shields.io/badge/Widget-CustomPainter-455A64)
![Android](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/Platform-iOS-000000?logo=apple&logoColor=white)
![Web](https://img.shields.io/badge/Platform-Web-4285F4?logo=google-chrome&logoColor=white)

Colección de pantallas y ejercicios que exploran animaciones, `CustomPainter`, composición de widgets y patrones visuales reutilizables. Diseñado para prototipado rápido y como material de portafolio.

## Funciones destacadas

- Navegación con rutas nombradas y `Navigator.pushNamed`.
- Estados compartidos con `Provider` y `ChangeNotifier`.
- Animaciones controladas con `AnimationController`, `CurvedAnimation` y `AnimatedBuilder`.
- Animaciones de entrada con `animate_do` (por ejemplo, `FadeInLeft`).
- Widgets personalizados con `CustomPainter` y composición de `CustomPaint`.
- Componentes reutilizables: progreso radial, slideshow, menú estilo Pinterest, headers curvos.
- Grillas tipo Pinterest usando `MasonryGridView` (`flutter_staggered_grid_view`).

## Requisitos

- Flutter 3.0 o superior.
- Dart SDK (incluido con Flutter).
- Dispositivo o emulador Android/iOS, o `flutter run -d chrome` para Web.

## Cómo ejecutarlo

```bash
flutter pub get
flutter run
```

La app inicia en la ruta Home y muestra un menú que enlaza a cada ejercicio.

## Rutas y demos principales

- Headers `CustomPainter` — `HeadersPage`
- Animations Playground — `AnimationsPage`
- Custom Progress — `CustomProgressPage`
- SlideShow dinámico — `SlideShowPage`
- Pinterest Grid + Menú flotante — `PinterestGridPage`
- Layout 1 — `Layout1Page`
- Layout 2 (CustomScrollView + Slivers) — `Layout2Page`

## Estructura rápida

- `lib/main.dart`: configura `MaterialApp` y `Provider`.
- `lib/src/router/app_routes.dart`: rutas nombradas y `onGenerateRoute`.
- `lib/src/models/`: estado (`SliderModel`, `PinterestModel`).
- `lib/src/widgets/`: headers, radial progress, slideshow, menú Pinterest, botones.
- `assets/`: recursos para demos.

## Tecnologías y paquetes

- Flutter, Dart, Material Design
- `provider` — estado simple y reactivo
- `animate_do` — animaciones de entrada
- `flutter_staggered_grid_view` — grillas tipo Masonry
- `CustomPainter`/`CustomPaint` — gráficos declarativos

## Ideas para extender

- Headers con gradientes animados.
- Nuevas tarjetas con `ImplicitlyAnimatedWidget`.
- Conectar progreso radial a datos reales (descargas, timers, etc.).
- Pruebas de widgets para slideshow, grid y providers.
- Acciones reales en menú Pinterest (filtros, favoritos, etc.).

## Licencia

MIT — ver archivo `LICENSE` en la raíz del repositorio.

