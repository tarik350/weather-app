# Weather App

This Weather App is a Flutter-based mobile application that provides weather updates for cities worldwide. The app is designed with a focus on clean architecture, separation of concerns, and maintainability, ensuring a robust and scalable solution.

## Features

- **Real-time Weather Updates**: Fetch current weather data for any city.
- **Caching**: Previously searched cities' weather data is cached locally for faster access.
- **Localization**: The app supports both English and Amharic languages, making it accessible to a broader audience.
- **State Management**: Uses the Bloc pattern for efficient state management.
- **Error Handling**: Graceful error handling with user-friendly messages.
- **Responsive UI**: All pages are stateless widgets optimized for performance.

## Project Architecture

This project follows a **Clean Architecture** approach to promote separation of concerns and maintainability. The architecture is organized into several layers:

- **Service Layer**: Handles network requests and communication with external APIs. For example, the `WeatherService` is responsible for fetching weather data from the OpenWeatherMap API.

- **Repository Layer**: Acts as an intermediary between the service layer and the business logic/UI layer. The `WeatherRepository` fetches data from either the remote source (via services) or local cache (using Hive for local storage). It then converts the raw data into models that the application can use.

- **Bloc Layer**: Manages the state and business logic of the application. It listens for events from the UI, interacts with repositories to fetch or update data, and emits new states that the UI reacts to. This ensures a clear separation between the UI and the underlying business logic.

- **UI Layer**: Comprises the Flutter widgets that present data to the user and handle user interactions. All the pages in the app are stateless, which is recommended for better performance.

### Naming Conventions

To ensure consistency and readability across the codebase, variables and methods have been given consistent and descriptive names throughout the app. This practice not only makes the code easier to understand and maintain but also aligns with the principles of Clean Architecture.

## Setup Instructions

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
- An IDE like [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/).

### Running the App Locally

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/weather_app.git
   cd weather_app
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Set up environment variables**:

   - Create a `.env` file in the root directory.
   - Add the following environment variables:

     ```env
     baseURL=https://api.openweathermap.org/data/2.5/weather
     geoBaseURL=http://api.openweathermap.org/geo/1.0
     imageBaseURL=http://openweathermap.org/img/wn/
     apikey=YOUR_API_KEY_HERE
     ```

4. **Run the app**:

   ```bash
   flutter run
   ```

### Additional Setup

- **Hive Database**: Used for local caching of weather data.
- **GetIt**: A service locator pattern is used for dependency injection. Services like `WeatherService`, `SettingServices`, and `StorageService` are initialized and registered with GetIt.

## Challenges and Future Improvements

- **Challenges**:

  - Managing state efficiently across multiple layers of the app.
  - Ensuring a consistent and user-friendly localization experience.
  - Handling network errors gracefully.

- **Future Improvements**:
  - Implementing unit and integration tests to further enhance code reliability.
  - Adding more languages for localization to cater to a broader audience.
  - Enhancing the UI with more interactive and dynamic elements.

## Conclusion

This Weather App demonstrates the use of modern Flutter development practices with a focus on clean architecture, maintainability, and performance. The project is a strong foundation for further enhancements and scalability.
