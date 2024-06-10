# Underscore

[![pub package](https://img.shields.io/pub/v/underscore.svg)](https://pub.dartlang.org/packages/underscore)
[![pub points](https://img.shields.io/pub/points/underscore?color=2E8B57&label=pub%20points)](https://pub.dev/packages/underscore/score)
[![](https://img.shields.io/badge/license-MIT-green)](https://github.com/bitinfinitywebsolutions/underscore/blob/master/LICENSE)

Underscore is a dart utility library for efficient Flutter development.

Underscore offers a versatile collection of over 100 functions tailored for everyday functional
needs such as mapping, filtering, and invoking, alongside specialized tools like function binding,
dart templating, rapid index creation, and comprehensive deep equality testing.

## How to use

#### 1. Depend on it

Add this to your package's pubspec.yaml file:

```
dependencies:
  underscore: ^0.0.1
```

#### 2. Install it

You can install packages from the command line:

with Flutter:

```
$ flutter pub add underscore
```

Alternatively, your editor might support `flutter packages get`. Check the docs for your editor to
learn more.

#### 3. Import it

Now in your Dart code, you can use:

```dart
import 'package:underscore/underscore.dart' as _;
```

#### 4. Use it

Now in your Dart code, you can use:

```dart
var users = [
    { 'user': 'barney', 'age': 36, 'active': true },
    { 'user': 'fred',   'age': 40, 'active': false }
];
_.filter(users, (o) => !(o['active']));
// output:  { 'user': 'fred', 'age': 40, 'active': false }
```
