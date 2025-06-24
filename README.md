# Pourhouse Wine Co. Companion App

A cross-platform mobile and web app for wine discovery, tracking, and engagement at Pourhouse Wine Co., built using Flutter and Firebase.

## ✨ Features (MVP)

- Scan QR codes to learn more about wines served at the bar
- Leave ratings and comments on wines
- Add and track personal wine discoveries
- Get notifications about upcoming events
- Works on Android, iOS, and the Web

---

## 📐 Architecture Overview

### App Architecture Diagram

```
+-----------------------------------------------------------+
|                      Pourhouse App UI                    |
|       (Flutter Frontend: Mobile & Web Clients)           |
+-----------------------------------------------------------+
| - Wine List (scanned / saved / discovered)               |
| - QR Code Scanner                                        |
| - Ratings & Comments Interface                           |
| - Events Feed & Notifications                            |
| - User Profile & Settings                                |
+-----------------------------------------------------------+
                            │
                            ▼
+-----------------------------------------------------------+
|                    Business Logic Layer                   |
|      (Provider / Riverpod / BLoC for State Management)    |
+-----------------------------------------------------------+
| - Wine Management                                         |
| - Event Handling                                          |
| - Notification Triggers                                  |
| - User Preferences & History                             |
+-----------------------------------------------------------+
                            │
                            ▼
+-----------------------------------------------------------+
|                       Firebase Backend                    |
+-----------------------------------------------------------+
| 🔹 Firebase Firestore       → Wines, Comments, Events     |
| 🔹 Firebase Auth            → Email, Google, Apple login  |
| 🔹 Firebase Storage         → Wine label images, avatars  |
| 🔹 Firebase Cloud Messaging → Push notifications          |
| 🔹 Firebase Hosting         → Web version of the app      |
+-----------------------------------------------------------+
                            │
                            ▼
+-----------------------------------------------------------+
|                 Admin & External Integrations             |
+-----------------------------------------------------------+
| - Admin Portal (e.g. Google Sheets, Firebase Console)     |
| - External Wine API (optional: Vivino, LCBO, etc.)        |
| - Google Analytics / Mixpanel for usage tracking          |
+-----------------------------------------------------------+
```

---

## 🛠️ Tech Stack

- **Flutter** – UI framework for building native-like apps
- **Firebase** – Auth, database, storage, hosting, messaging
- **VS Code (Windows)** – Development environment

---

## 🔮 Future Ideas

- Wine recommendation engine
- Loyalty and rewards system
- Tasting notes AI assistant
- Dynamic QR codes for events or promotions

---

## 📦 Getting Started

```bash
flutter pub get
flutter run
```

Make sure you have Flutter installed and set up. For Firebase integration, follow the [FlutterFire documentation](https://firebase.flutter.dev/docs/overview/).

---

## 📄 License

MIT License – © Pourhouse Wine Co.
