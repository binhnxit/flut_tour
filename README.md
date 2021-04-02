[![Build Status](https://github.com/dart-lang/usage/workflows/Dart/badge.svg)](https://github.com/dart-lang/usage/actions)

A minor Flutter base_source

### [Getting Started](#gettingstarted)
Run command in order to generate native resources
```
flutter pub get
```

### [Main Packages](#packages)
  *  [Provider](https://pub.dev/packages/provider): An app state management
  *  [dio](https://pub.dev/packages/dio): An HTTP networking library

### [Usage](usage)

#### Common steps to add a new screen
* Create a new widget (`Stateful/Stateless` widgets)
* Create a new `Provider` class that extends `ChangeNotifierSafety`
* Define the screen route in `app_route.dart`
* Init the `Provider` class in `my_app.dart`

#### Add a new http request
* Create a new request class that extends `APIClient`
* Write a `Future` function inside the request class (*), this function must return the http Response info.
* Inside the `Provider` class, write a `Future` function, the main responsibility of this function is call the `Future` function inside the request class (*) with specified `Duration`.
* Handle the Response (parse data, request status code... ).

#### How to add assets

* Icon
```
① Generate an icon by 1x, 2x, 3x then add these icons into (assets/icons/…) folders.
② Remember that, these icons located in a different folder (2.0x, 3.0x,...) but their name must be the same.
```

* Font
