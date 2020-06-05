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

    test('Moment.add(years:1, months: 4, days: 6)', () {
      DateTime currentDateString = DateTime.parse("2020-06-03 11:25:28.001");
      Moment currentDate = Moment.fromDate(currentDateString);
      expect(
        currentDate.add(years: 1, months: 4, days: 6).compareTo(DateTime.parse("2021-10-09 11:25:28.001")) == 0,
        isTrue,
      );
    });

    test('Moment.substract(years:1, months: 2, days: 3)', () {
      DateTime currentDateString = DateTime.parse("2020-06-03 11:25:28.001");
      Moment currentDate = Moment.fromDate(currentDateString);
      expect(
        currentDate.subtract(years: 1, months: 2, days: 3).compareTo(DateTime.parse("2019-03-31 11:25:28.001")) == 0,
        isTrue,
      );
    });

    test('Moment.format(pattern)', () {
      Moment currentDate = Moment.fromDate(DateTime.parse("2020-06-03 11:25:28.001"));
      expect(currentDate.format("yyyy-MM-dd HH:mm").compareTo("2020-06-03 11:25") == 0, isTrue);
    });

    test("get quarter", (){
      Moment currentDate = Moment.fromDate(DateTime.parse("2020-06-03 11:25:28.001"));

      expect(currentDate.quarter == 2, isTrue);
    });
  });
}
