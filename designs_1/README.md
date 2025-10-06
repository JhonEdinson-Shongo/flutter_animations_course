# Designs 1 - Flutter Animations Course

Proyecto de practica basado en Flutter que recopila ejercicios cortos de animaciones, `CustomPainter` y widgets reutilizables. Cada pantalla esta pensada para mostrar un patron visual distinto y ofrecer fragmentos de codigo listos para reutilizar en otros proyectos personales.

## Funciones destacadas
- Navegacion con rutas nombradas y `Navigator.pushNamed`.
- Estados compartidos con `Provider` y `ChangeNotifier`.
- Animaciones controladas con `AnimationController`, `CurvedAnimation` y `AnimatedBuilder`.
- Widgets personalizados con `CustomPainter` y composicion de `CustomPaint`.
- Componentes reutilizables como progreso radial, slideshow configurable y menu flotante al estilo Pinterest.
- Grillas tipo Pinterest usando `MasonryGridView` del paquete `flutter_staggered_grid_view`.

## Requisitos
- [Flutter](https://docs.flutter.dev/get-started/install) 3.0 o superior.
- Dart SDK (incluido con Flutter).
- Dispositivo o emulador Android/iOS, o `flutter run -d chrome` para web.

## Como ejecutarlo
```bash
flutter pub get
flutter run
```
La app inicia en la ruta `Home` y muestra un menu que enlaza a cada ejercicio.

## Ejercicios en la pagina principal

### 1. Headers CustomPainter (`HeadersPage`)
Diferentes encabezados decorativos construidos con `CustomPaint`.

- Aprende a definir `CustomPainter` y dibujar con `Path` y `Paint` (`lib/src/widgets/headers.dart`).
- Experimenta con curvas, diagonales y gradientes animables.

```dart
class HeaderShowcase extends StatelessWidget {
  const HeaderShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderRounded(),
        SizedBox(height: 24),
        HeaderWaveGradient(),
      ],
    );
  }
}
```
Usa `Navigator.pushNamed(context, 'HeadersPage')` para abrir la galeria completa.

### 2. Animations Playground (`AnimationsPage`)
Coleccion de cajas animadas que combinan rotaciones, fades, traslaciones y escalado.

- Se profundiza en los ciclos de vida de `AnimationController` y en listeners de estado.
- Incluye patrones de repeticion infinita, interpolaciones por intervalos y secuencias encadenadas (`lib/src/pages/animations_page.dart`).

```dart
class AnimatedDemo extends StatelessWidget {
  const AnimatedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSquare(),
        SizedBox(height: 16),
        AnimatedSquareMove(),
      ],
    );
  }
}
```
Navega con `Navigator.pushNamed(context, 'AnimationsPage')` para ver todas las variaciones.

### 3. Custom Progress (`CustomProgressPage`)
Comparativa entre el indicador circular nativo y un progreso radial personalizado.

- `RadialProgress` anima el avance mediante `CustomPainter` y calcula arcos con trigonometria (`lib/src/widgets/radial_progress.dart`).
- Botones flotantes permiten incrementar, reiniciar o disminuir el avance (`lib/src/pages/progress_bar_page.dart`).

```dart
class ProgressExample extends StatelessWidget {
  const ProgressExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: RadialProgress(
        progress: 0.65,
        stroke: 8,
        secondStroke: 4,
        animationDuration: 1200,
        colorProgress: Colors.indigo,
        colorBackground: Colors.grey.shade300,
      ),
    );
  }
}
```
Abre la pantalla con `Navigator.pushNamed(context, 'CustomProgressPage')` para interactuar con los controles.

### 4. SlideShow dinamico (`SlideShowPage`)
Un carrusel configurable que sincroniza la pagina actual mediante `Provider`.

- Admite navegacion horizontal o vertical y posicion flexible de los indicadores (`lib/src/widgets/slider_show.dart`).
- Exponer `DotPosition` y `Axis` facilita crear presentaciones responsivas.

```dart
class SlideShowExample extends StatelessWidget {
  const SlideShowExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      slides: const [
        FlutterLogo(size: 120),
        Icon(Icons.animation, size: 120),
        Icon(Icons.palette, size: 120),
      ],
      positionDots: DotPosition.bottom,
      bulletSize: 18,
      bulletColorActive: Colors.indigo,
      bulletColorInactive: Colors.black26,
      directionSlides: Axis.horizontal,
    );
  }
}
```
Lleva al usuario a esta vista con `Navigator.pushNamed(context, 'SlideShowPage')` y experimenta con los botones para cambiar posicion y tamano de los bullets.

### 5. Pinterest Grid + Menu flotante (`PinterestGridPage`)
Replica un feed estilo Pinterest con tarjetas de alto variable y un menu flotante animado.

- `PinterestGrid` usa `MasonryGridView.builder` para crear una grilla irregular basada en alturas aleatorias (`lib/src/pages/pinterest_grid_page.dart`).
- El `PinterestMenu` muestra botones que reaccionan al scroll: se oculta al bajar y reaparece al subir (`lib/src/widgets/Pinterest_menu.dart`).
- `PinterestModel` sincroniza el boton activo y la visibilidad con `ChangeNotifier` (`lib/src/models/pinterest_model.dart`).

```dart
class PinterestPreview extends StatelessWidget {
  const PinterestPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return PinterestMenu(
      backgroundColor: Colors.white,
      items: [
        PinterestButton(
          icon: Icons.home_outlined,
          activeColor: Colors.redAccent,
          onPressed: () {},
        ),
        PinterestButton(
          icon: Icons.search,
          activeColor: Colors.green,
          onPressed: () {},
        ),
      ],
      child: const PinterestGrid(),
    );
  }
}
```
En la pantalla de inicio, abre esta demo con `Navigator.pushNamed(context, 'PinterestGridPage')` para probar el menu y el efecto de scroll.

## Arquitectura rapida
- `lib/main.dart`: arma el `MaterialApp` y registra `Provider` para `SliderModel` y `PinterestModel` (ver configuracion actual).
- `lib/src/router/app_routes.dart`: rutas nombradas y `onGenerateRoute` de respaldo.
- `lib/src/models/`: contiene `SliderModel` y `PinterestModel` para manejar estado compartido.
- `lib/src/widgets/`: componentes reutilizables (headers, radial progress, slideshow, menu estilo Pinterest).
- `assets/svgs/`: graficos auxiliares para futuras practicas.

## Ideas para extender
- Agregar mas headers con gradientes animados.
- Crear nuevas tarjetas animadas con `ImplicitlyAnimatedWidget`.
- Conectar el progreso radial a datos reales (descargas, timers, etc.).
- Crear pruebas widget para validar la interaccion de slideshow, grid y provider.
- Disparar acciones reales desde los botones del menu Pinterest (filtros, favoritos, etc.).

Listo para publicar el repositorio y seguir creciendo con nuevos ejercicios de animacion.
