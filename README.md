# 📱 Zero-Waste Smart Management Mobile App

## 🌿 Overview
This mobile application is a companion tool for the Zero-Waste Smart Management System. Built with **Flutter**, it assists municipal cleaners by providing real-time waste monitoring, automated alerts, and waste collection management. The app connects seamlessly with the web platform to ensure efficient waste disposal and cleaner urban environments.

## 🚀 Key Features
- 🔔 **Real-Time Alerts:** Notifies cleaners when dustbins are full based on ultrasonic sensor data.  
- 📍 **Location-Based Updates:** Displays the exact location of full dustbins for easy navigation.  
- ✅ **Waste Collection Status:** Allows cleaners to mark dustbins as emptied, resetting their status on the platform.  
- 🔄 **Auto-Refresh Dashboard:** Updates waste bin status every 5 seconds for accurate monitoring.  
- 🏆 **User-Friendly Interface:** Simple and intuitive design for easy use by municipal workers.  

## 🏗️ Tech Stack
- **Framework:** Flutter  
- **Language:** Dart  
- **Backend Integration:** REST API connection with Flask server  
- **State Management:** Provider / Riverpod (optional)  
- **Local Storage:** Shared Preferences (if needed)  

## ⚙️ Installation Guide

### Prerequisites
- Flutter SDK installed ([Installation Guide](https://flutter.dev/docs/get-started/install))
- An emulator or physical device for testing
- Python backend server running (for API connection)

### Setup Steps
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd mobile_app
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Connect a device or start an emulator:
   ```bash
   flutter devices
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## 🔗 API Configuration
Update the API base URL in the app to connect with your Flask backend:

- Open `lib/constants.dart` (or equivalent file)  
- Set your backend server URL:
  ```dart
  const String apiUrl = "http://<your-backend-ip>:5000";
  ```

## 📱 Usage Instructions
1. Log in with authorized municipal cleaner credentials (if authentication is implemented).  
2. View all dustbins' statuses and their respective fill levels.  
3. Receive real-time notifications for bins that are full.  
4. After waste collection, tap the **'Completed'** button to reset the bin status.  

## 💡 App Workflow
1. Real-time bin data is fetched from the Flask backend every 5 seconds.  
2. Notifications are triggered when a dustbin reaches full capacity.  
3. Cleaners mark bins as emptied, updating both the app and the central system.  

## 🤝 Contributors
- Krishna Prasad
- Sudhin Suresh
- Aashish S
- Team Name: Orque

## 📜 License
This project is licensed under the [MIT License](LICENSE).

## 📧 Contact
For queries or support, contact us at [your-email@example.com].
