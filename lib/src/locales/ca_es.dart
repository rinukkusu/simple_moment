// Copyright (c) 2018, moraleja39. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleCaEs implements ILocaleData {
  String get seconds => 'uns segons';

  String get aMinute => 'un minut';
  String get minutes => '%i minuts';

  String get anHour => 'una hora';
  String get hours => '%i hores';

  String get aDay => 'un dia';
  String get days => '%i dies';

  String get aMonth => 'un mes';
  String get months => '%i mesos';

  String get aYear => 'un any';
  String get years => '%i anys';

  String get futureIdentifier => 'd\'aquí a';
  String get pastIdentifier => 'fa';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}
