// Copyright (c) 2016, rinukkusu. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import '../localedata.dart';
import '../identifier_position.dart';

class LocaleIt implements ILocaleData {
  final String _localeString;
  String get localeString => _localeString;

  LocaleIt([this._localeString = "it"]);

  String get seconds => 'un secondo';

  String get aMinute => 'un minuto';
  String get minutes => '%i minuti';

  String get anHour => 'un \'ora';
  String get hours => '%i ore';

  String get aDay => 'un giorno';
  String get days => '%i giorni';

  String get aMonth => 'un mese';
  String get months => '%i mesi';

  String get aYear => 'un anno';
  String get years => '%i anni';

  String get futureIdentifier => 'tra';
  String get pastIdentifier => 'fa';

  IdentifierPosition get futurePosition => IdentifierPosition.prepend;
  IdentifierPosition get pastPosition => IdentifierPosition.prepend;
}

