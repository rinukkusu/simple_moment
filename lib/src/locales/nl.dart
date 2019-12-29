// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleNl implements ILocaleData {
  String get seconds => 'een paar seconden';

  String get aMinute => 'een minuut';
  String get minutes => '%i minuten';

  String get anHour => 'een uur';
  String get hours => '%i uren';

  String get aDay => 'een dag';
  String get days => '%i dagen';

  String get aMonth => 'een maand';
  String get months => '%i maanden';

  String get aYear => 'een jaar';
  String get years => '%i jaren';

  String get futureIdentifier => 'in';
  String get pastIdentifier => 'geleden';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.append;
}
