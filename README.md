# Shongo - Portafolio de Disenos y Animaciones en Flutter

![Flutter](https://img.shields.io/badge/Flutter-3%2B-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-2%2B-0175C2?logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/State%20Mgmt-Provider-7F52FF?logo=flutter&logoColor=white)
![Material Design](https://img.shields.io/badge/UI-Material%20Design-757575?logo=materialdesign&logoColor=white)
![Android](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/Platform-iOS-000000?logo=apple&logoColor=white)
![Web](https://img.shields.io/badge/Platform-Web-4285F4?logo=google-chrome&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

Espacio para encapsular ideas de estudio y disenos UI/UX en Flutter. El repositorio esta organizado en subproyectos independientes: una plantilla base para arrancar disenos rapido y demos enfocadas en animaciones, `CustomPainter` y componentes reutilizables.

- Portafolio orientado a mostrar buenas practicas y velocidad de prototipado.
- Subcarpetas autocontenidas para clonar, probar y extender sin friccion.

## Enlaces Rapidos

- Ir a `designs_1`: designs_1/README.md
- Plantilla base `template_app`: template_app/
- Como ejecutar: #como-ejecutar
- Como crear un nuevo diseno: #crear-un-nuevo-diseno-desde-template_app
- Buenas practicas: #buenas-practicas

## Estructura del Repositorio

- `designs_1/`: coleccion de pantallas y patrones visuales con animaciones, `CustomPainter`, slideshow, grid tipo Pinterest, etc. Documentacion detallada en designs_1/README.md.
- `template_app/`: plantilla lista para copiar y crear un nuevo diseno con estructura, rutas, tema y Provider configurados.
- `LICENSE`: MIT.

## Proyectos

### designs_1

Demostraciones enfocadas en patrones de UI y animaciones:

- Animaciones controladas: `AnimationController`, `CurvedAnimation`, `AnimatedBuilder`.
- Transiciones de entrada con `animate_do` (p. ej. `FadeInLeft`).
- `CustomPainter` para headers curvos, ondas y gradientes.
- Slideshow configurable con indicadores, eje y posicion personalizable.
- Grid estilo Pinterest usando `flutter_staggered_grid_view` mas menu flotante.
- Estado compartido con `Provider`/`ChangeNotifier`.

Mas info, snippets y rutas en designs_1/README.md.

### template_app

Base minima pero completa para acelerar nuevos disenos:

- App esqueleto con `MaterialApp`, `AppTheme`, `AppRoutes` y `Provider`.
- Estructura recomendada: `lib/` -> `models/`, `src/pages/`, `src/widgets/`, `src/router/`, `src/themes/`.
- Linting: `flutter_lints` activado (analysis_options.yaml).
- Localizacion por defecto: `en`, `es`.

Recomendado para iniciar un nuevo subproyecto clonado desde aqui.

## Requisitos

- Flutter 3.x o superior
- Dart SDK (incluido con Flutter)
- Dispositivo/emulador Android o iOS, o Chrome para Web

## Como Ejecutar

Ejecuta cada subproyecto desde su carpeta:

```bash
# designs_1
cd designs_1
flutter pub get
flutter run

# template_app (si quieres revisar la plantilla en ejecucion)
cd template_app
flutter pub get
flutter run
```

## Crear un nuevo diseno desde template_app

1) Duplica la carpeta `template_app` y renombrala (por ejemplo, `designs_2`).
2) Actualiza el `name` en `pubspec.yaml` y el `package` en imports si aplica.
3) Ajusta el `bundle id`/`applicationId` si vas a compilar en movil.
4) Personaliza:
   - `lib/src/router/app_routes.dart` para nuevas rutas.
   - `lib/src/themes/app_theme.dart` para colores y tipografias.
   - `lib/models/` y `Provider` segun el estado que requieras.
5) Ejecuta `flutter pub get` y `flutter run` desde la carpeta del nuevo proyecto.

Sugerencia: Manten los assets dentro de cada subproyecto (`assets/`) para independencia total.

## Buenas Practicas

- Estructura
  - `lib/models`: estado global con `ChangeNotifier`/`Provider`.
  - `lib/src/pages`: pantallas autocontenidas y enfocadas.
  - `lib/src/widgets`: componentes reutilizables, sin acoplar a paginas.
  - `lib/src/router`: rutas nombradas y `onGenerateRoute` de respaldo.
  - `lib/src/themes`: paleta, tipografias y estilos.
- Estado
  - Prefiere `Provider` para simplicidad. Eleva estado solo cuando sea necesario.
  - Evita logica de negocio en widgets; usa modelos o servicios.
- Estilo y Calidad
  - Activa lints (`flutter_lints`) y corre `dart format .` antes de subir cambios.
  - Nombra archivos y clases de forma descriptiva y consistente.
  - Manten widgets pequenos, componibles y con una sola responsabilidad.
- Commits
  - Usa Convencional Commits: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`.
  - Mensajes cortos y claros; describe el "por que" en el cuerpo si aplica.

## Roadmap

- Nuevos layouts con `Slivers`, `ImplicitlyAnimatedWidget` y transiciones custom.
- Componentes e-commerce (catalogo, carrito, checkout) para ampliar el portafolio.
- Tests de widgets clave (slideshow, grid y providers) para robustez.
- Mejores demos con assets y gifs de previsualizacion.

## Preguntas Frecuentes

- Puedo ejecutar cada carpeta de forma independiente?
  - Si. Cada subcarpeta es un proyecto Flutter autonomo.
- Donde agrego mis imagenes y SVGs?
  - Dentro de `assets/` de cada subproyecto y declaarlos en su `pubspec.yaml`.

## Licencia

Este repositorio se distribuye bajo licencia MIT. Ver `LICENSE` para mas detalles.
