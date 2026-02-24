# Rapio Flutter - AGENTS.md

## Project Overview

A Flutter application for streaming music radio channels. Uses BLoC pattern for state management with clean separation of concerns.

## Build Commands

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run on specific platform
flutter run -d <device_id>

# Build for iOS (simulator)
flutter build ios --simulator --no-codesign

# Build for Android (debug)
flutter build apk --debug

# Build for Android (release)
flutter build apk --release
```

## Lint & Analysis

```bash
# Run static analysis
flutter analyze

# Run a single test file
flutter test test/filename.dart

# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## Code Style Guidelines

### Imports
- Use package imports: `package:music_radio_toni/...`
- Group imports: dart imports, package imports, relative imports
- Example:
```dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_radio_toni/model/radio_channel.dart';

import '../../bloc/radio_list_bloc/radio_bloc.dart';
```

### Formatting
- Follows standard Dart formatting (run `dart format .`)
- 2-space indentation
- Trailing commas for readability

### Naming Conventions
- **Files**: snake_case (e.g., `radio_player_bloc.dart`)
- **Classes**: PascalCase (e.g., `RadioPlayerBloc`)
- **Constants**: camelCase with `k` prefix for theme constants (e.g., `kColorScheme`)
- **Screen IDs**: snake_case strings (e.g., `radio_list_screen`)

### Types
- Use explicit types for class properties
- Use `late` for properties initialized in initState
- Use `const` constructors where possible

### BLoC Pattern
- Events extend base event class or use sealed classes
- States extend base state class or use sealed classes
- Bloc constructor takes initial state
- Use `on<Event>` to register handlers

## Architecture

```
lib/
├── main.dart                    # App entry point, MaterialApp setup
├── bloc/
│   ├── radio_list_bloc/         # Radio list state management
│   │   ├── radio_bloc.dart
│   │   ├── radio_list_event.dart
│   │   └── radio_state.dart
│   └── radio_player_bloc/       # Radio player state management
│       ├── radio_player_bloc.dart
│       ├── radio_player_event.dart
│       └── radio_player_state.dart
├── model/
│   └── radio_channel.dart       # Data model
├── repositories/
│   └── broadcast_api_data.dart  # Static radio channel data
├── routes/
│   └── routes.dart              # Route generation and navigation
└── views/
    ├── screens/
    │   ├── radio_list_screen.dart
    │   └── radio_player_screen.dart
    └── widgets/
        ├── play_pause_button.dart
        ├── radio_item.dart
        ├── radio_player_title_image.dart
        └── waver_visualizer.dart
```

### Entry Points
- **Main**: `lib/main.dart` - Initializes MaterialApp with theming and routing
- **Screens**: Static `id` property used for route names (e.g., `RadioListScreen.id`)

### State Management
- **BLoC Pattern** with `flutter_bloc`
- **RadioListBloc**: Manages list of available radio channels
- **RadioPlayerBloc**: Manages playback state, play/pause, favorites

### Navigation
- Named routes with static ID constants
- RouteGenerator class handles all route creation
- Arguments passed via `arguments` parameter

## Repo-Specific Rules

1. **Screen Route IDs**: Always use static `id` constant for route names (e.g., `RadioListScreen.id`)
2. **BLoC Initialization**: Pass required dependencies in constructor (e.g., `audioSource` for RadioPlayerBloc)
3. **Theme Constants**: Define at top of file with `k` prefix (e.g., `kColorScheme`, `kDarkColorScheme`)
4. **State Classes**: Use sealed classes or extend base state classes
5. **Asset Images**: Add to `pubspec.yaml` under `flutter.assets`
6. **Model Classes**: Use Equatable for value equality when needed

## Dependencies

Key packages used:
- `flutter_bloc: ^8.1.3` - State management
- `audioplayers: ^5.2.1` - Audio playback
- `equatable: ^2.0.5` - Value equality
- `uuid: ^4.3.3` - Unique ID generation
- `flutter_animator: ^3.2.2` - Animations
- `wave: ^0.2.2` - Wave visualization

## Testing

Currently no tests exist in the `test/` directory. When adding tests:
- Place in `test/` directory
- Follow naming: `filename_test.dart`
- Use `flutter_test` package
