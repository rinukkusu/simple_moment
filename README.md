# simple_moment [![Pub](https://img.shields.io/pub/v/simple_moment.svg)](https://pub.dartlang.org/packages/simple_moment) [![Build Status](https://travis-ci.org/rinukkusu/simple_moment.svg?branch=master)](https://travis-ci.org/rinukkusu/simple_moment)

A simple implementation of the Moment.js features for relative time in Dart.

## Usage

A simple usage example:

```dart
import 'package:simple_moment/simple_moment.dart';

main() {
    var secondsToAdd = new Duration(seconds: 10);
    var dateForComparison = new DateTime.now().add(secondsToAdd);
    var moment = new Moment.now();

    // should print "in a few seconds"
    print(moment.from(dateForComparison));
    
    Moment rawDate = Moment.parse("2020-07-03");
      // should print "2020-08-03 00:00:00.000
      print(rawDate.add(months: 1));
    
      // should print "2019-07-03 00:00:00.000
      print(rawDate.subtract(years: 1));
    
      //should print "03-07-2020 00:00"
      print(rawDate.format("dd-MM-yyyy HH:mm"));
}
```

## Locales

### Set the locale for all usages of `Moment`:

```dart
Moment.setLocaleGlobally(new LocaleDe());
```

### Set the locale only for the current instance of `Moment`:

```dart
var moment = new Moment.now().locale(new LocaleDe());
```

### Adding your own locale:

Just create a class that implements `ILocaleData` and assign that to your `Moment` instance or set it globally.


### Overwriting existing locales:

```dart
class ShortLocaleEn extends LocaleEn {
  String get seconds => '%is';

  String get aMinute => '%im';
  String get minutes => '%im';

  String get anHour => '%ih';
  String get hours => '%ih';

  String get aDay => '%id';
  String get days => '%id';
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/rinukkusu/simple_moment/issues
