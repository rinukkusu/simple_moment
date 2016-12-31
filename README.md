# simple_moment

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
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/rinukkusu/simple_moment/issues
