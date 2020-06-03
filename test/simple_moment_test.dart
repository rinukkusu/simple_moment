// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:simple_moment/simple_moment.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    String dateString = "2016-12-31 02:33:01.565411";
    DateTime date = DateTime.parse(dateString);

    DateTime currentDate = DateTime.parse("2016-12-31 12:00:00");

    setUp(() {});

    test('static Moment.parse', () {
      expect(Moment.parse(dateString).toString() == dateString, isTrue);
    });

    test('new Moment.fromDate', () {
      expect(new Moment.fromDate(date).toString() == dateString, isTrue);
    });

    test('Moment.from(future)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 12:00:30");
      expect(
          new Moment.fromDate(currentDate).from(compareDate) ==
              "in a few seconds",
          isTrue);
    });

    test('Moment.from(past)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 11:59:30");
      expect(
          new Moment.fromDate(currentDate).from(compareDate) ==
              "a few seconds ago",
          isTrue);
    });

    test('Moment.from(less than a second ago)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 11:59:59.001");
      expect(
        new Moment.fromDate(currentDate).from(compareDate) ==
            "a few seconds ago",
        isTrue,
      );
    });


  });
}
