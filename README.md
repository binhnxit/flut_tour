[![Build Status](https://github.com/dart-lang/usage/workflows/Dart/badge.svg)](https://github.com/dart-lang/usage/actions)

A minor Flutter base_source

### [Getting Started](#gettingstarted)

```
 Flutter (Channel stable, 2.0.4)
 Dart 1.22.4
 ```

Run command in order to generate native resources
```
flutter pub get
```

### [Main Packages](#packages)
  *  [Provider](https://pub.dev/packages/provider): An app state management.
  *  [dio](https://pub.dev/packages/dio): An HTTP networking library.

### [Usage](usage)

#### Common steps to add a new screen
* Create a new widget (`Stateful/Stateless` widgets).
* Create a new `Provider` class that extends `ChangeNotifierSafety`.
* Define the screen route in [`app_route.dart`](https://github.com/dubydu/flut_tour/blob/master/lib/utils/app_route.dart).
* Init the `Provider` class in [`my_app.dart`](https://github.com/dubydu/flut_tour/blob/master/lib/my_app.dart).

#### Config the app environment
* Take a look at the [`app_config.dart`](https://github.com/dubydu/flut_tour/blob/master/lib/utils/app_config.dart)

#### Add a new http request
* Create a new request class that extends [`APIClient`](https://github.com/dubydu/flut_tour/blob/master/lib/services/api/api_client.dart) class.
* Write a `Future` function inside the request class (*), this function must return the http Response info.
* Inside the `Provider` class, write a `Future` function, the main responsibility of this function is call the `Future` function inside the request class (*) with specified `Duration`.
* Handle the Response (parse data, request status code...).

#### How to add assets

[1. Icon](https://github.com/dubydu/flut_tour/tree/master/assets/app/icons)

* Generate an icon into 1x, 2x and 3x, then add these icons into (assets/icons/…) folders.
* Remember that, these icons located in a different folder (2.0x, 3.0x,...) but their name must be same.

[2. Font]()

updating...
