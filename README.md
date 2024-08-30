# FlightFusion

Booking Airline Ticket Apps.

## How To Run

Flavor is currently only work with Android build. For iOS, there is no need to call --flavor as argument in every command or you can run with copy launch.json on this link : https://drive.google.com/file/d/106jTJZrCj3YofwXgcYoJC-W_CUqF5vzg/view?usp=sharing

- development:

  ```
  flutter run --flavor development -t lib/main_development.dart
  ```

- staging:

  ```
  flutter run --flavor staging -t lib/main_staging.dart
  ```

- production:
  ```
  flutter run --flavor production -t lib/main_production.dart
  ```

## How To Build APK

- development:

  ```
  flutter build apk --split-per-abi --flavor development -t lib/main_development.dart --release
  ```

- staging:

  ```
  flutter build apk --split-per-abi --flavor staging -t lib/main_staging.dart --release
  ```

- production:
  ```
  flutter build apk --split-per-abi --flavor production -t lib/main_production.dart --release
  ```
