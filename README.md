# TPS Hub Mobile App

The **TPS Hub Mobile App** is a mobile platform designed to streamline communication, event management, and access to academic resources for the TPS community. Built with Flutter and powered by Firebase, the app provides a smooth user experience for over 1,000 users.

## Features
- **Announcements & Updates**: Stay informed with the latest school announcements.
- **Committee Dashboards**: Access and manage school committees with a built-in dashboard.
- **Academic Resources**: View and download study materials and assignments.
- **Messaging**: Built-in messaging to foster communication between users.
- **Push Notifications**: Real-time notifications for key events and announcements.
- **User Profiles**: Users can customize their profiles and preferences.

## Getting Started

### Prerequisites
To run this project, you’ll need:
- Flutter SDK
- Firebase account (for authentication and push notifications)
- Dart programming knowledge (for making contributions)

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/edwardmagongo/tps-hub
    cd TPSHub
    ```

2. Install Flutter dependencies:
    ```bash
    flutter pub get
    ```

3. Set up Firebase:
    - Go to the [Firebase Console](https://firebase.google.com/) and create a new project.
    - Add Firebase to your Flutter project by downloading the `google-services.json` file (for Android) or `GoogleService-Info.plist` (for iOS) and placing them in the respective directories of your project:
      - `android/app/google-services.json`
      - `ios/Runner/GoogleService-Info.plist`
    - Enable Firebase Authentication and Cloud Messaging.

4. Run the app:
    ```bash
    flutter run
    ```

### Firebase Integration
The app uses Firebase for:
- **Authentication**: User login and profile management.
- **Cloud Messaging**: Real-time push notifications.
- **Firestore Database**: Storing user data, announcements, and event details.

Ensure you configure Firebase correctly by adding the required files and setting up authentication and notifications in your Firebase console.

## Contributing

If you’d like to contribute:

1. Fork the repo and create a new branch:
    ```bash
    git checkout -b feature/YourFeature
    ```

2. Make your changes and commit:
    ```bash
    git commit -m 'Add YourFeature'
    ```

3. Push your branch:
    ```bash
    git push origin feature/YourFeature
    ```

4. Open a Pull Request, and your changes will be reviewed.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, reach out to:

**Edward Magongo**  
Email: [edwardmagongo123@gmail.com](mailto:edwardmagongo123@gmail.com)

---

Thank you for contributing to TPS Hub!
