# YouTube Lite - Flutter InAppWebView

A simple Flutter web-view application that allows users to browse YouTube with a minimal interface using `flutter_inappwebview`.

## 🚀 Features
- Embedded YouTube web browsing
- Supports back navigation
- Shows page load progress
- Landscape & portrait mode support


## 🛠 Installation
### Prerequisites
- Flutter SDK installed
- Dart installed
- Android/iOS emulator or physical device

### Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/santorasu/youtube_lite.git
   cd youtube-lite
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## 📄 Required Permissions
Ensure the following permissions are added in `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
<android:usesCleartextTraffic="true"/>
```

## 📝 Dependencies Used
- [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview)
- [url_launcher](https://pub.dev/packages/url_launcher)

## 📌 Notes
- YouTube may restrict video playback in WebView.
- If nothing appears, try using `https://m.youtube.com` instead of `https://www.youtube.com`.

## 🤝 Contributing
Pull requests are welcome! Feel free to open an issue or submit improvements.
