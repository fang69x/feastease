# feastease




**FeastEase** is a Flutter-based food delivery application that allows users to explore various food categories, add items with custom add-ons to their cart, and proceed with a smooth checkout process. The app features user authentication (via Google and email), location services, and a Firebase-powered backend to manage food items, cart data, and order receipts.

## Features

- **User Authentication**: Supports both Google sign-in and email/password authentication using Firebase.
- **Location-Based Services**: Automatically detects and shows the user's current location on the home page.
- **Food Categories**: Browse through a wide variety of food categories to find your favorite dishes.
- **Cart Management**: Add, edit, and remove items from your cart, including customizable add-ons.
- **Order Checkout**: View your order summary and proceed with checkout.
- **Firebase Firestore**: Order receipts and cart data are securely stored in Firestore.
- **Payment Integration (Upcoming)**: A secure payment gateway is under development for the orders.

## Getting Started

To get a local copy of this project up and running, follow the installation steps below.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Firebase Account](https://firebase.google.com/)
- [Google Maps API Key](https://developers.google.com/maps/gmp-get-started) (for location services)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/FeastEase.git
   cd feastease
   ```

2. **Install dependencies:**

   Run the following command in the project root directory:

   ```bash
   flutter pub get
   ```

3. **Set up Firebase:**

   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
   - Enable Firebase Authentication and Firestore.
   - Add Firebase configuration to the Flutter project by following the [Firebase setup guide](https://firebase.flutter.dev/docs/overview).

4. **Set up Google Maps API:**

   - Enable the Google Maps API from the [Google Cloud Console](https://console.cloud.google.com/).
   - Add the API key to your Flutter project for location services.

5. **Run the app:**

   Connect a device or emulator, then execute:

   ```bash
   flutter run
   ```

## Project Structure

Here’s an overview of the key directories and files in the project:

```plaintext
/lib
│
├── main.dart                  # Entry point of the app
├── authentication/            # Handles Firebase Authentication logic
├── models/                    # Data models for food items, cart, and user
├── pages/                     # UI pages like login, home, cart, and checkout
├── services/                  # Firebase Firestore services and Google Maps API integration
├── widgets/                   # Reusable components like food tiles, buttons, etc.
└── utils/                     # Utility classes for handling payment, navigation, etc.
```

## Features in Progress

- **Payment Integration**: Secure payment processing for order completion.
- **Order Tracking**: Real-time order tracking feature based on user location.
- **Notifications**: Push notifications for order updates and promotions.

## Contributing

Contributions are highly encouraged! To get started:

1. Fork this repository.
2. Create a new branch (`git checkout -b feature/amazing-feature`).
3. Make your changes and commit (`git commit -m 'Add some feature'`).
4. Push to your branch (`git push origin feature/amazing-feature`).
5. Open a pull request.

## Future Plans

- **Multi-Restaurant Support**: Expand the app to support multiple restaurants and dynamic food menus.
- **User Reviews**: Allow users to leave reviews and ratings for food items.
- **Dark Mode**: Introduce a dark mode for better accessibility.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for more details.

---


