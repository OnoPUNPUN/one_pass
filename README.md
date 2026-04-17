# One Pass

One Pass is now set up as a clean-architecture Flutter starter inspired by the
structure used in `OnoPUNPUN/dev-blogs`.

## What is included

- Feature-first folder structure
- `core/` for shared app concerns
- `data / domain / presentation` layer separation
- `flutter_bloc` for presentation state
- `get_it` for dependency injection
- `go_router` for app routing
- `dio` for HTTP client setup
- `shared_preferences` and `flutter_secure_storage` for persistence
- `connectivity_plus` and `internet_connection_checker_plus` for network checks
- `logger` for structured logging
- `bloc_test` and `mocktail` for testability

## Structure

```text
lib/
  core/
    constants/
    di/
    error/
    network/
    router/
    storage/
    theme/
    usecase/
  features/
    counter/
      data/
      domain/
      presentation/
  src/
    app.dart
    bootstrap.dart
```

## Current sample feature

The app includes a persisted counter feature that demonstrates:

- local data source
- repository abstraction
- use cases
- BLoC state management
- dependency injection
- routing into a real page

This gives you a working vertical slice that can be copied when you add real
features like auth, profile, sync, or pass management.

## Run

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```
