// Copyright (c) 2016, rinukkusu.
// Copyright (c) 2021, sombochea.
// All rights reserved. Use of this source code.
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:simple_moment/simple_moment.dart';
import 'package:simple_moment/src/locales/km.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Moment.setLocaleGlobally(new LocaleKm());

    String dateString = "2021-03-18 02:33:01.565411";
    DateTime date = DateTime.parse(dateString);

    DateTime currentDate = DateTime.parse("2021-03-18 12:00:00");

    setUp(() {});

    test('static Moment.parse', () {
      expect(Moment.parse(dateString).toString(), dateString);
    });

    test('new Moment.fromDate', () {
      expect(new Moment.fromDate(date).toString(), dateString);
    });

    test('Moment.from(future)', () {
      DateTime compareDate = DateTime.parse("2021-03-18 12:00:30");
      expect(new Moment.fromDate(currentDate).from(compareDate),
          "ក្នុង ពីរ​ឬ​បីវិនាទី");
    });

    test('Moment.from(past)', () {
      DateTime compareDate = DateTime.parse("2021-03-18 11:59:30");
      expect(new Moment.fromDate(currentDate).from(compareDate),
          "ពីរ​ឬ​បីវិនាទី មុន");
    });
  });
}
