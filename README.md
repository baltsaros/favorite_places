# favorite_places
A simple Flutter app that allows user to manage a list of favorite places. The app was done as part of a Udemy course on Flutter.

## About the project
* Written in ***Dart***
* Uses the ***ImagePicker*** package to take photos with the camera
* Utilizes ***GoogleMaps*** for map functionality
* Data is stored locally using ***Sqflite***

## Functionality
* Add and remove favorite places from the list
* Each place has a name, an image (taken via the phone camera) and a geolocation (set manually or automatically)

## Installation
* Prerequisites (a significant number): Android Studio, Android SDK, Android SDK Tools, NDK, Android SDK Command Line Tools, CMake, Adroid Emulator, JDK, git, VS Code Dart and Flutter plugins
* Use `flutter doctor -v` to check whether all requirements are met
* Clone the repo. Bette to kep the original name (otherwise you need to edit imports)
* Run `flutter pub get` to install all dependencies
* Create `.env` and add your `GOOGLE_API_KEY` to enable Google Maps module
* Execute `flutter run` to launch the app

## Demo
<p align="center">
  <img src="https://github.com/baltsaros/favorite_places/blob/main/places_demo.gif" height="600" alt="Favorite places demo">
</p>

## Links
* [Udemy coures](https://campus19.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/)
* [Article](https://medium.com/@nayanbabariya/set-up-environment-variables-in-flutter-for-secure-and-scalable-apps-7409ae0c383e) on how to use environmental variables in *.xml* files