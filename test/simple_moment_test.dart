// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:intl/date_symbol_data_local.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    String dateString = "2016-12-31 02:33:01.565411";
    DateTime date = DateTime.parse(dateString);

    DateTime currentDate = DateTime.parse("2016-12-31 12:00:00");

    setUp(() {});

    test('static Moment.parse', () {
      expect(Moment.parse(dateString).toString(), dateString);
    });

    test('new Moment.fromDate', () {
      expect(new Moment.fromDate(date).toString(), dateString);
    });

    test('Moment.from(future)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 12:00:30");
      expect(new Moment.fromDate(currentDate).from(compareDate),
          "in a few seconds");
    });

    test('Moment.from(past)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 11:59:30");
      expect(new Moment.fromDate(currentDate).from(compareDate),
          "a few seconds ago");
    });

    test('Moment.from(less than a second ago)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 11:59:59.001");
      expect(new Moment.fromDate(currentDate).from(compareDate),
          "a few seconds ago");
    });

    test('Moment.add(years:1, months: 4, days: 6)', () {
      DateTime currentDateString = DateTime.parse("2020-06-03 11:25:28.001");
      Moment currentDate = Moment.fromDate(currentDateString);
      expect(currentDate.add(years: 1, months: 4, days: 6).date,
          DateTime.parse("2021-10-09 11:25:28.001"));
    });

    test('Moment.substract(years:1, months: 2, days: 3)', () {
      DateTime currentDateString = DateTime.parse("2020-06-03 11:25:28.001");
      Moment currentDate = Moment.fromDate(currentDateString);
      expect(currentDate.subtract(years: 1, months: 2, days: 3).date,
          DateTime.parse("2019-03-31 11:25:28.001"));
    });

    test('Moment.format(pattern)', () {
      Moment currentDate =
          Moment.fromDate(DateTime.parse("2020-06-03 11:25:28.001"));
      expect(currentDate.format("yyyy-MM-dd HH:mm"), "2020-06-03 11:25");
    });

    test('Moment.format(pattern) with localization', () async {
      Moment currentDate =
          Moment.fromDate(DateTime.parse("2020-06-03 11:25:28.001"))
              .locale(new LocaleDe(), useInFormat: true);

      await initializeDateFormatting(currentDate.usedLocale.localeString);

      expect(currentDate.format("LLLL"), "Juni");
    });

    test("get quarter", () {
      Moment currentDate =
          Moment.fromDate(DateTime.parse("2020-06-03 11:25:28.001"));

      expect(currentDate.quarter, 2);
    });
  });
}
