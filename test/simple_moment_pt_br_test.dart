// Copyright (c) 2018, lennonjesus. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:simple_moment/simple_moment.dart';
import 'package:simple_moment/src/locales/pt_br.dart';
import 'package:test/test.dart';

void main() {
  group('Um grupo de testes', () {
    Moment.setLocaleGlobally(new LocalePtBr());

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

    test('Moment.from(futuro)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 12:00:30");
      expect(
          new Moment.fromDate(currentDate).from(compareDate) ==
              "em alguns segundos",
          isTrue);
    });

    test('Moment.from(passado)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 11:59:30");
      expect(
          new Moment.fromDate(currentDate).from(compareDate) ==
              "alguns segundos atrás",
          isTrue);
    });

    test('Moment.from(menos de um segundo atrás)', () {
      DateTime compareDate = DateTime.parse("2016-12-31 11:59:59.001");
      expect(
          new Moment.fromDate(currentDate).from(compareDate) ==
              "alguns segundos atrás",
          isTrue);
    });
  });
}
