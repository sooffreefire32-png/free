# Lance-It: A Professional Freelancing Marketplace

Lance-It is a fully functional Flutter application designed to serve as a professional freelancing marketplace. It is designed to connect clients looking to hire talent with freelancers looking for work.

## Features
- **Authentication & Onboarding**: Email/Password & Social Login, with role selection.
- **Client Features**: Post jobs, manage job postings, hire flow.
- **Freelancer Features**: Browse job feeds, submit proposals, view statistics.
- **Shared Features**: Messaging system, profile management, wallet/payments.

## Directory Structure
Lance-It adopts a feature-first architecture, which is highly modular and scalable. Key folders include:

### Core
Contains common utilities, constants (e.g., styles, colors, routes), services (e.g., navigation, logger, storage), and shared widgets (e.g., buttons, text fields).

### Features
Each feature (e.g., authentication, client, freelancer) is further divided into:
  - **Data**: Models, repositories, and data sources.
  - **Domain**: Entities and use cases.
  - **Presentation**: Blocs and UI screens/widgets.

### Android Configuration
Includes Android-specific files like `AndroidManifest.xml` and `gradle` configuration for production readiness.

## Requirements
This project requires Flutter 3.x.

Install Flutter by following the [Flutter installation guide](https://flutter.dev/docs/get-started/install).

## Installation
1. Clone this repository:
    ```
    git clone <repository_url>
    ```

2. Navigate to the project directory:
    ```
    cd lance_it
    ```

3. Install dependencies:
    ```
    flutter pub get
    ```

4. Run the project:
    ```
    flutter run
    ```

## Folder Map
To get a better understanding of the project layout, refer to the following structure:

- `lib/`
  - `main.dart`
  - `core/`
    - `constants/`
      - `colors.dart` (app-wide colors scheme)
      - `styles.dart` (text and widget styles)
      - `strings.dart` (all string constants)
      - `routes.dart` (defines app routes)
    - `services/`
      - `navigation_service.dart` (handles navigation)
      - `logger_service.dart` (logging utility for debugging)
      - `storage_service.dart` (local storage handling)
    - `widgets/` (reusable custom widgets like `LoadingSpinner` and `CustomButton`)
  - `features/`
    - `authentication/`
      - `data/models/user_model.dart` (model for user data)
      - `data/repositories/auth_repository.dart`
      - `domain/entities/user.dart`
      - `domain/usecases/` (login and register use cases)
      - `presentation/bloc/auth_bloc.dart`
      - `presentation/screens/login_screen.dart`
      - `presentation/screens/signup_screen.dart`
  - `client/` (Handles Client-specific features and data models)
  - `freelancer/` (Handles Freelancer-specific features and data models)
  - `shared/` (Messaging, profile, and wallet systems shared by both roles)

## Notes
- UI is responsive and designed with `Material Design Principles`.
- Mock API services are currently implemented and can be replaced with a real backend in the services layer later.
- Entire code is written using the Null Safety feature available in Dart.

## Dependencies
The app uses the following dependencies:
- [provider](https://pub.dev/packages/provider): State management.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): State management using Bloc.
- [google_fonts](https://pub.dev/packages/google_fonts): To customize typography.
- [http](https://pub.dev/packages/http): For making network requests.
- [intl](https://pub.dev/packages/intl): For date/time formatting.

## Contribution
Feel free to fork the repository and create pull requests. For major changes, open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License.