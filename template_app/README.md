# template_app — Plantilla base para nuevos diseños

![Flutter](https://img.shields.io/badge/Flutter-3%2B-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-2%2B-0175C2?logo=dart&logoColor=white)
![Provider](https://img.shields.io/badge/State%20Mgmt-Provider-7F52FF?logo=flutter&logoColor=white)
![Flutter Lints](https://img.shields.io/badge/Lint-flutter__lints-4CAF50)
![Android](https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/Platform-iOS-000000?logo=apple&logoColor=white)
![Web](https://img.shields.io/badge/Platform-Web-4285F4?logo=google-chrome&logoColor=white)

Plantilla mínima pero completa para crear un nuevo subproyecto de diseño. Incluye estructura de carpetas, tema, rutas, estado global y lints para mantener consistencia desde el primer commit.

## Objetivo

- Arrancar diseños rápidos con una base consistente.
- Facilitar el escalado con rutas y estado ya conectados.
- Mantener calidad con lints y estructura clara.

## Estructura del proyecto

```
lib/
  main.dart                 # MaterialApp, tema, rutas, localización
  models/
    global_model.dart       # Estado global con ChangeNotifier
  src/
    pages/                  # Pantallas (Home, Headers, etc.)
    router/
      app_routes.dart       # Rutas nombradas y registro centralizado
    themes/
      app_theme.dart        # Colores, tipografías, ThemeData
    widgets/                # Componentes reutilizables
```

Puntos clave:

- `main.dart` monta `MultiProvider`, registra `GlobalProvider`, y aplica `AppTheme`.
- `app_routes.dart` centraliza rutas (usa `initialRoute` + `routes`).
- `app_theme.dart` expone `ThemeData` claro y tokens de color.
- `models/` alberga estados con `ChangeNotifier` para desacoplar lógica UI.

## Cómo usar esta plantilla

1) Duplica la carpeta `template_app` y renómbrala (por ejemplo, `designs_2`).
2) Edita `pubspec.yaml` → `name:` y, si aplica, ajusta imports de `package:template_app/...` a `package:designs_2/...`.
3) Personaliza tema en `lib/src/themes/app_theme.dart`.
4) Define rutas/páginas en `lib/src/router/app_routes.dart` y `lib/src/pages/`.
5) Agrega estado nuevo en `lib/models/` y regístralo en `main.dart` con `Provider`.
6) Ejecuta `flutter pub get` y `flutter run` desde la carpeta del nuevo proyecto.

## Requisitos

- Flutter 3.x o superior
- Dart SDK (incluido con Flutter)

## Ejecutar

```bash
flutter pub get
flutter run
```

## Buenas prácticas

- Mantén widgets pequeños y componibles.
- Evita lógica de negocio en widgets; usa modelos (`ChangeNotifier`).
- Usa rutas nombradas y un único registro central.
- Activa lints (`analysis_options.yaml`) y corre `dart format .` antes de subir.
- Commits convencionales: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`.

## Licencia

MIT — ver `LICENSE` en la raíz del repositorio.
