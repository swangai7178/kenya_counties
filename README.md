<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

A Flutter package that provides a county picker for selecting Kenyan counties in your app.
.

## Features

  - County Picker
  - Customizable UI
  - Support for All Kenyan Counties
  - Easy Integration
  - Cross-Platform Support

## Getting started

### Prerequisites

Before you begin, ensure you have met the following requirements:
- Flutter SDK installed on your machine. See [official Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions.

import 'package:kenya_counties/kenya_counties.dart';

### Installation

To use this package, add `kenya_counties` as a dependency in your `pubspec.yaml` file.
## Usage



```dart
CountySearchField(
    onCountySelected: (selectedCounty) {
    setState(() {
    id = selectedCounty['index'].toString();
    name = selectedCounty['name'];
    });
        },
),
```


