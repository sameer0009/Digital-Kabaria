# Digital Kabaria MVP

A cross-platform Flutter application for the Digital Kabaria scrap marketplace.

## Project Structure
This is a path-referenced Flutter monorepo containing:
- `apps/mobile_app`: Seller and Dealer mobile applications.
- `apps/admin_web`: Operations team Flutter Web dashboard.
- `packages/shared_core`: Routing constants, utilities, and base Riverpod providers.
- `packages/design_system`: Theme, typography, colors, and reusable widgets.
- `packages/domain_models`: Freezed models (Entities) and serialization.
- `packages/data_layer`: Firebase integration, abstract repository implementations.

## Setup Instructions

### Prerequisites
- Flutter SDK (latest stable)
- Node.js (for Firebase Emulators)
- Firebase CLI (`npm install -g firebase-tools`)

### Local Environment (Emulator Suite)
This MVP uses the Firebase Emulator Suite for local development so that keys are not required.

1. Install emulator dependencies:
   ```bash
   firebase setup:emulators:firestore
   ```

2. Start the Emulators:
   ```bash
   firebase emulators:start --only auth,firestore,storage
   ```
   *Note: In `data_layer/lib/src/firebase_setup.dart`, the apps are hard-configured to connect to `localhost`. If running on an Android physical device, you may need to forward ports or change `localhost` to your machine's IP.*

### Run Mobile App
```bash
cd apps/mobile_app
flutter pub get
flutter run
```

### Run Admin Web
```bash
cd apps/admin_web
flutter pub get
flutter run -d chrome
```

## Architecture
Built using feature-first directory layout inside apps, and layered package architecture (Domain -> Data -> Presentation). State management is handled by **Riverpod 3.0 (AsyncNotifier)**. Routing uses **GoRouter** with deep linking support. Models use **Freezed** and **JSON Serializable**.
