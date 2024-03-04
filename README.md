<p align="center">
    <a href="https://store.sublimescripts.com"><img src="https://store.sublimescripts.com/wp-content/uploads/2024/02/CartPioneer.png" alt="Total Downloads"></a>
</p>

# CartPioneer: Flutter eCommerce App with WordPress API

[CartPioneer](https://store.sublimescripts.com/) is an open-source eCommerce mobile app created with Flutter and powered by the WordPress API. It revolutionizes mobile commerce, transforming your SublimeScripts store into a dynamic platform.

## Overview

CartPioneer seamlessly synchronizes products and categories in real-time, providing a user-friendly interface for efficient order management. Built on the SublimeScripts eCommerce framework and leveraging the robust Laravel stack, it offers comprehensive features for a superior mobile shopping experience.

## Features

- **Real-time Synchronization:** Keep your products and categories up-to-date.
- **User-friendly Interface:** Effortlessly manage orders with a simple and intuitive design.
- **Built on SublimeScripts and Laravel:** Utilizes a powerful eCommerce framework for robust functionality.
- **Accelerated Time-to-Market:** Easily manage product information for quicker launches.
- **Complete Control:** Take charge of your store with CartPioneer's comprehensive features.

## Installation Guide

Before beginning with the installation, you will need the following with the mentioned versions

- CartPioneer Version - v1.0.0
- Android Studio Version - Flamingo | 2022.2.1 
- Flutter Version - 3.19.1
- Dart - 3.2.5
- Xcode - 14.3
- Swift - 5

Make sure you have installed the API module and set this up properly on your Worpress api base adress.

> NOTE: It is recommended that you run a simple Hello World program in Flutter first before proceeding further so that you are sure that the environment is properly set up.

## Installation Steps

### Clone the repository

- Open your terminal or command prompt
- Navigate to the directory where you want to save the project
- Use the git clone command followed by the repository URL

```sh
git clone https://github.com/matifaligoraya/wp-ecom
```
### Install dependencies

- Navigate to the project's directory

```sh
cd <repository-name>
```
  
- Run the following command to install the required packages

```sh
flutter pub get
```
### Generate Required files

- Navigate to the project's directory

```sh
cd <repository-name>
```

- Run the following command to generate the required files

```sh
flutter pub run build_runner build --delete-conflicting-outputs 
```

### Connect a device or emulator

* Physical Device

  1. Enable USB debugging on your device
  2. Connect it to your computer using a USB cable.

* Emulator

  1. Start an Android or iOS emulator using your preferred IDE or tools.
 
### Run the Project

- Use the following command to build and run the project

```sh
flutter run
```
## Minimum Versions

- Android: 21
- iOS: 12

## Configurations Steps

### For Setup

Change the baseUrl  as per your store

**Path:** lib/Utils/Constant/base_adress_api.dart

```sh
static const String baseUrl = ‘....’;
```
<!-- > Note: Add the value of the complete URL ending with the GraphQL API endpoint. E.g - https://example.com/graphql  -->

### For Theme

Change the Theme for your app

**Path:** lib/Utils/app_colors.dart

```sh
static const Color primaryColor = Color(***********);  
static const Color accentColor = Color(***********); 
```

<!-- ### For Push Notification Service

- Android 

Replace "google-services.json".
- iOS 

Replace "GoogleService-Info.plist".

> Helpful Articles

> Android  → https://mobikul.com/knowledgebase/generating-google-service-file-enable-fcm-firebase-cloud-messaging-android-application/

> iOS → https://mobikul.com/knowledgebase/generating-new-googleservice-info-plist-file-fcm-based-project-ios-app/
 -->
### For Application Title

* Android

  1. **Path:** android/app/src/main/AndroidManifest.xml
  2. **Change app name:** android:label="***********"

* iOS

  1. Go to the general tab and identity change the display name to your app name
 
> For Homepage Header Title - Go to ‘assets/language/en.json’
> (Note: Here, “en” in en.json refers to the languages that would be supported within the application)

<!-- ### For Splash Screen

* For adding Lottie as Splash Screen

  1. **Path:** assets/lottie/splash_screen.json
  2. After updating the Lottie file, update the ‘splashLottie’ in lib/utils/assets_constants.

```sh
 static const String splashLottie = "assets/lottie/splash_screen.json";
```
 
* For adding an Image as a Splash Screen

  1. **Path:** assets/images/splash.png
  2. After updating the Image file, update the ‘splashImage’ in lib/utils/assets_constants.

```sh
  static const String splashImage = "assets/images/splash.png";
``` -->
### For App Icon

* **Android:** Open the android folder in Android Studio and then right click app > new > Image Asset set Image.
* **iOS:** Replace the icons over the path > ios/Runner/Assets.xcassets/AppIcon.appiconset
<!-- 
## Installation Video

[![Watch the video](https://i.ibb.co/c6qd31t/thumbnail-1.jpg)](https://www.youtube.com/watch?v=tvm2NUZP9ks) -->


## API Documentation

For the API Documentation, please go through - https://developer.wordpress.org/rest-api/

## Usage

For detailed usage instructions, refer to the official documentation

## Contributing

Contributions are welcome! Follow the contribution guidelines to get started.

## License

CartPioneer is open-sourced software licensed under the MIT license.



